package com.laptrinhjavaweb.dto;

import org.springframework.web.bind.annotation.RestController;

public class AssignmentBuildingDTO {
    private Long buildingId;
    private Long[] staffs;

    public Long getBuildingId() {
        return buildingId;
    }

    public void setBuildingId(Long buildingId) {
        this.buildingId = buildingId;
    }

    public Long[] getStaffs() {
        return staffs;
    }

    public void setStaffs(Long[] staffs) {
        this.staffs = staffs;
    }
}
