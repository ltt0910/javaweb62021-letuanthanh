package com.laptrinhjavaweb.service.impl;

import com.laptrinhjavaweb.converter.BuildingConverter;
import com.laptrinhjavaweb.converter.UserConverter;
import com.laptrinhjavaweb.dto.BuildingDTO;
import com.laptrinhjavaweb.dto.reponse.RentAreaDTO;
import com.laptrinhjavaweb.dto.reponse.StaffReponse;
import com.laptrinhjavaweb.entity.BuildingEntity;
import com.laptrinhjavaweb.entity.RentAreaEntity;
import com.laptrinhjavaweb.entity.UserEntity;
import com.laptrinhjavaweb.enums.BuildingTypesEnum;
import com.laptrinhjavaweb.enums.DistrictsEnum;
import com.laptrinhjavaweb.repository.BuildingRepository;
import com.laptrinhjavaweb.repository.RentAreaRepository;
import com.laptrinhjavaweb.repository.UserRepository;
import com.laptrinhjavaweb.security.utils.SecurityUtils;
import com.laptrinhjavaweb.service.IBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.*;

@Service
public class BuildingService implements IBuildingService {

    @Autowired
    private BuildingConverter buildingConverter;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private UserConverter userConverter;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RentAreaService rentAreaService;
    @Override
    public List<BuildingDTO> searchBuilding(Map<String,Object> params,List<String> buildingTypes) {
        List<BuildingEntity> entities = new ArrayList<>();
        if(SecurityUtils.getAuthorities().contains("ROLE_staff")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            entities= buildingRepository.findBuildingAssignmentByStaff(params,buildingTypes,staffId);
        }
        else{
            entities = buildingRepository.searchBuilding(params,buildingTypes);
        }

        List<BuildingDTO> result = new ArrayList<>();
        for(BuildingEntity buildingEntity :entities){
            List<String> rentAreaStrings = new ArrayList<>();
            List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreaEntityList();
            for(RentAreaEntity item:rentAreaEntities){
                if(item.getValue()!=null){
                    rentAreaStrings.add(item.getValue().toString());
                }
            }
            Object[] rentAreas = rentAreaStrings.toArray();
            String rentArea = Arrays.toString(rentAreas).replace("[","");
            rentArea = rentArea.replace("]","");
            rentArea = rentArea.replace(" ","");
            BuildingDTO buildingDTO = buildingConverter.convertToDTO(buildingEntity);
            buildingDTO.setRentArea(rentArea);
            buildingDTO.setAddress(buildingEntity.getStreet()+"-"+buildingEntity.getWard()+"-"+DistrictsEnum.existDistrict(buildingEntity.getDistrict()));
            result.add(buildingDTO);
        }
        return result;
    }

    @Override
    @Transactional
    public void save(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.convertToEntity(buildingDTO);
        String[] buildingTypes = buildingDTO.getBuildingTypes();
        String types = Arrays.toString(buildingTypes).replace("[","");
        types = types.replace("]","");
        types = types.replace(" ","");
        buildingEntity.setTypes(types);
        buildingRepository.save(buildingEntity);
        if(buildingDTO.getId()==null){
            RentAreaDTO rentAreaDTO = new RentAreaDTO();
            rentAreaDTO.setBuildingId(buildingEntity.getId());
            String[] rentAreas = buildingDTO.getRentArea().split(",");
            for (String item: rentAreas) {
                try {
                    rentAreaDTO.setValue(Integer.parseInt(item));
                }catch (Exception e){

                }
                if(rentAreaDTO.getValue()!=null){
                    rentAreaService.addRentArea(rentAreaDTO);
                }
            }
        }
        else{
            rentAreaService.deleteRentArea(buildingDTO.getId());
            RentAreaDTO rentAreaDTO = new RentAreaDTO();
            rentAreaDTO.setBuildingId(buildingEntity.getId());
            String[] rentAreas = buildingDTO.getRentArea().split(",");
            for (String item: rentAreas) {
                rentAreaDTO.setValue(Integer.parseInt(item));
                rentAreaService.addRentArea(rentAreaDTO);
            }
        }
        }

    @Override
    public void delete(Long id) {
        try{
            buildingRepository.delete(id);
        }catch (Exception e){

        }
    }

    @Override
    public Map<String, String> districtName() {
        Map<String,String> result = new HashMap<>();
        for (DistrictsEnum item:DistrictsEnum.values()){
            result.put(item.toString(),item.getDistrictValue());
        }
        return result;
    }

    @Override
    public Map<String, String> buildingTypes() {
        Map<String,String> result = new HashMap<>();
        for (BuildingTypesEnum item:BuildingTypesEnum.values()){
            result.put(item.toString(),item.getBuildingTypes());
        }
        return result;
    }
    public BuildingDTO findById(Long id){
        BuildingDTO buildingDTO = new BuildingDTO();
        BuildingEntity buildingEntity = buildingRepository.findOne(id);
        String[] buildingTypes = buildingEntity.getTypes().split(",");
        List<String> rentAreaStrings = new ArrayList<>();
        List<RentAreaEntity> rentAreaEntities = buildingEntity.getRentAreaEntityList();
        for(RentAreaEntity item:rentAreaEntities){
            rentAreaStrings.add(item.getValue().toString());
        }
        Object[] rentAreas = rentAreaStrings.toArray();
        String rentArea = Arrays.toString(rentAreas).replace("[","");
        rentArea = rentArea.replace("]","");
        rentArea =rentArea.replace(" ","");
        buildingDTO = buildingConverter.convertToDTO(buildingEntity);
        buildingDTO.setBuildingTypes(buildingTypes);
        buildingDTO.setRentArea(rentArea);
        return buildingDTO;
    }

    @Override
    public List<StaffReponse> getStaff(Long buildingId) {
        List<StaffReponse> result = new ArrayList<>();
        List<UserEntity> userEntities = buildingRepository.getStaffs(buildingId);
        for(UserEntity item:userEntities){
            StaffReponse staffReponse = userConverter.convertToStaffReponse(item);
            if(userRepository.setChecked(buildingId,item.getId())){
                staffReponse.setChecked("checked");
            }
            result.add(staffReponse);
        }
        return result;
    }

}
