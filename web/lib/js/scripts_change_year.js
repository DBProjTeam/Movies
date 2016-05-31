$("#from_year").change(function () {
    console.log($("#to_year").attr({
        min: $("#from_year").val()
    }));
});
