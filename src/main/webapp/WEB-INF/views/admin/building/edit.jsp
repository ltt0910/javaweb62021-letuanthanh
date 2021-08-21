
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<c:url var="buildingAPI" value="/api/building"/>
<html>
<head>
    <title>Thêm Tòa nhà</title>
</head>
<body>
    </div>
    <div class="page-content">
        <div class="row">
            <div class="col-xs-12">
                <form class="form-horizontal" role="form" id ="formEdit">
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="name"> Tên tòa nhà </label>

                        <div class="col-sm-9">
                            <input type="text" id="name" name="name" placeholder="Tên Tòa nhà" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="floorArea"> Diện tích sàn </label>

                        <div class="col-sm-9">
                            <input type="number" id="floorArea" name="floorArea" placeholder="Diện tich sàn" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="numberOfBasement"> Số tầng hầm </label>

                        <div class="col-sm-9">
                            <input type="number" id="numberOfBasement" name="numberOfBasement" placeholder="Số tầng hầm" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right">Quận</label>
                        <div class="col-sm-3">
                            <form:select path="district" cssClass="form-control">
                                <form:option value="-1" label="--Quận--"/>
                                <form:options items="${district}"/>
                            </form:select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="ward">Phường </label>

                        <div class="col-sm-9">
                            <input type="text" id="ward" placeholder="Tên phường" name="ward" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="street">Đường </label>

                        <div class="col-sm-9">
                            <input type="text" id="street" placeholder="Tên đường" name="street" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="structure">Kết cấu </label>

                        <div class="col-sm-9">
                            <input type="text" id="structure" name="structure" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="direction">Hướng </label>

                        <div class="col-sm-9">
                            <input type="text" id="direction" name="direction" placeholder="Chọn Hướng" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="level">Hạng </label>

                        <div class="col-sm-9">
                            <input type="text" id="level" name="level" placeholder="Chọn hạng" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="rentArea">Diện tích thuê </label>

                        <div class="col-sm-9">
                            <input type="text" id="rentArea" name="rentArea" placeholder="Diện tích thuê" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="descriptionArea">Mô tả diện tích </label>

                        <div class="col-sm-9">
                            <input type="text" id="descriptionArea" name="descriptionArea" placeholder="Mô tả diện tích" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="costRent">Giá thuê </label>

                        <div class="col-sm-9">
                            <input type="number" id="costRent" name="costRent" placeholder="Giá thuê" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="desciptionCostRent">Mô tả giá </label>

                        <div class="col-sm-9">
                            <input type="text" id="desciptionCostRent" name="desciptionCostRent" placeholder="Mô Tả Giá thuê" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="electricityCost">Tiền điện </label>

                        <div class="col-sm-9">
                            <input type="text" id="electricityCost" name="electricityCost"  class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="waterCost">Tiền nước </label>

                        <div class="col-sm-9">
                            <input type="text" id="waterCost" name="waterCost"  class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="feeCar">Phí ô tô </label>

                        <div class="col-sm-9">
                            <input type="text" id="feeCar" name="feeCar"  class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="feeMotor">Phí mô tô </label>

                        <div class="col-sm-9">
                            <input type="text" id="feeMotor" name="feeMotor"  class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="feeFreeTime">Phí ngoài giờ </label>

                        <div class="col-sm-9">
                            <input type="text" id="feeFreeTime" name="feeFreeTime"  class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="feeService">Phí dịch vụ </label>

                        <div class="col-sm-9">
                            <input type="text" id="feeService" name="feeService"  class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="deposit">Đặt cọc </label>

                        <div class="col-sm-9">
                            <input type="text" id="deposit"  name="deposit" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="payment">Thanh toán </label>

                        <div class="col-sm-9">
                            <input type="text" id="payment" name="payment"  class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="timeRent">Thời gian thuê</label>

                        <div class="col-sm-9">
                            <input type="text" id="timeRent" name="timeRent" class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="decoratorTime">Thời gian trang trí </label>

                        <div class="col-sm-9">
                            <input type="text" id="decoratorTime" name="decoratorTime"  class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="managerName">Tên quản lý </label>

                        <div class="col-sm-9">
                            <input type="text" id="managerName" name="managerName"  class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-3 control-label no-padding-right" for="managerPhone">Số điện thoại quản lý</label>

                        <div class="col-sm-9">
                            <input type="tel" id="managerPhone" name="managerPhone"  class="col-xs-10 col-sm-12" />
                        </div>
                    </div>
                    <!-- checkbox -->
                        <div class="form-group">
                            <label class="col-sm-3 control-label no-padding-right">Loại tòa nhà</label>
                            <div >
                                <div class="checkbox">
                                    <c:forEach var="item" items="${buildingTypes}">
                                        <label class="pos-rel">
                                            <input type="checkbox" class="ace" />
                                            <span class="lbl">${item.value}</span>
                                        </label>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-3 control-label no-padding-right" style="margin-left: 200px">
                            <button type="button" class="btn btn-success" data-dismiss="modal" id="btnAddBuilding">Thêm tòa nhà</button>
                            <button type="button" class="btn btn-rotate" data-dismiss="modal">Hủy</button>
                        </div>
                </form>
            </div>
        </div>
    </div>

    <%--<script !src=""></script>--%>
    <script>
        $('#btnAddBuilding').click(function (e) {
            e.preventDefault();
            var data = {};
            var formData = $('#formEdit').serializeArray();
            $.each(formData,function (inddex, v) {
                    data[""+v.name+""]=v.value;
            });
            $.ajax({
                url: "/api/building",
                type: "POST",
                dataType: 'json',
                contentType: 'application/json',
                data: JSON.stringify(data),
                success: function (res) {
                    console.log("success");
                },
                error: function (res) {
                    console.log("failed");
                    console.log(res);
                }
            });
        });
    </script>
</body>
</html>
