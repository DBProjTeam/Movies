$("#from_year").change(function () {
    $("#to_year").attr({
        min: $("#from_year").val()
    });
});
