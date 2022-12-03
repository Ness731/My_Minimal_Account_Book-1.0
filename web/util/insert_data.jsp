<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <title>My Minimal Account Book</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
    <link href="../resources/css/sb-admin-2.css?after" rel="stylesheet"/>

    <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css"/>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
</head>
<script type="text/javascript">
    $(document).ready(function () {
        $.datepicker.setDefaults($.datepicker.regional['ko']);
        $("#expend_date").datepicker({
            changeMonth: true,
            changeYear: true,
            nextText: '다음 달',
            prevText: '이전 달',
            dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
            dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
            monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
            dateFormat: "yy-mm-dd",
            maxDate: 0,
            onClose: function (selectedDate) {
                $("#endDate").datepicker("option", "minDate", selectedDate);
            }
        });
    });
</script>

<script type="text/javascript">
    function check_dataForm() {
        const form = document.dataForm;
        let amount = form.amount;
        let tag = form.tag;
        let tagCheck = /^(#).*/;
        let amountCheck = /^[0-9]+$/;
        if (amount.value == "") {
            alert("소비한 금액을 입력해주세요.");
            amount.focus();
        } else if (!amountCheck.test(amount.value)) {
            alert("금액은 숫자 형식으로만 기입해주세요.");
            amount.focus();
        } else if (tag.value != "") {
            if (!tagCheck.test(tag.value)) {
                alert("해시태그는 # 문자로 구문해주세요.");
                tag.focus();
            } else {
                form.method = "post";
                form.action = "../util/insert_data_process.jsp";
                form.submit();
            }
        } else {
            form.method = "post";
            form.action = "../util/insert_data_process.jsp";
            form.submit();
        }
    }
</script>

<style>
    /* DatePicker CSS */
    .ui-widget-header {
        border: none !important;
        background-color: transparent !important;
    }

    .ui-state-default, .ui-widget-content .ui-state-default, .ui-widget-header .ui-state-default, .ui-button, html .ui-button.ui-state-disabled:hover, html .ui-button.ui-state-disabled:active {
        border: 1px solid #fff !important;
        background: #fff !important;
        font-weight: normal !important;
        color: #212121 !important;
        text-align: center !important;
        font-size: 15px;
    }

    .ui-widget.ui-widget-content {
        width: auto;
    }

    .ui-datepicker .ui-datepicker-title {
        background: #fff;
        font-size: 15px;
    }

    .ui-datepicker .ui-datepicker-header {
        background: #fff;
        width: auto;
    }

    .ui-datepicker th {
        font-size: 15px;
        padding: 0.7em !important;
    }

    .ui-datepicker-calendar th:first-child {
        color: #c74352 !important;
    }

    .ui-datepicker-calendar th:nth-last-child(1) {
        color: #208cc0 !important;
    }

    .ui-datepicker-calendar tr td:first-child a {
        color: #c74352 !important;
    }

    .ui-datepicker-calendar tr td:nth-last-child(1) a {
        color: #0d47a1 !important;
    }
</style>
<body>
<form name="dataForm" enctype="multipart/form-data" ;>
    <div class="row d-flex justify-content-center align-items-center">
        <div class="p-4 text-center">
            <div class="mb-md-0 mt-md-0 pb-5">
                <div class="form-outline form-white mb-4">
                    <label class="col-form-label script">소비일자</label>
                    <input name="expend_date" type="text" id="expend_date" class="form-control form-control-sm"
                           readonly/>
                </div>

                <div class="form-outline form-white mb-4">
                    <label class="col-form-label script">금액</label>
                    <input name="amount" type="text" class="form-control form-control-sm"/>
                </div>

                <div class="form-outline form-white mb-4">
                    <label class="col-form-label script">카테고리</label>
                    <select name="category" class="custom-select">
                        <option value="food">식비</option>
                        <option value="hobby">취미</option>
                        <option value="shopping">쇼핑</option>
                        <option value="living">생활/주거</option>
                        <option value="medical">의료/피트니스</option>
                        <option value="transpt">교통/자동차</option>
                        <option value="finance">금융/세금</option>
                        <option value="other">기타</option>
                    </select>
                </div>

                <div class="form-outline form-white mb-4">
                    <label class="col-form-label script">설명</label>
                    <textarea name="description" class="form-control" rows="3" style="resize: none;"></textarea>
                </div>

                <div class="form-outline form-white mb-4">
                    <label class="col-form-label script">태그</label>
                    <input name="tag" type="text" class="form-control form-control-sm"/>
                </div>

                <div class="form-outline form-white mb-4">
                    <label class="col-form-label script">이미지</label>
                    <input name="img" type="file" class="form-control-sm form-control-file"/>
                </div>
                <button class="btn btn-primary px-5 script mb-0" type="button" onclick="check_dataForm()">
                    추가하기
                </button>
            </div>
        </div>
    </div>
</form>
</body>
</html>
