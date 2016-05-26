<div class="bloc_rating">
    <form class="rating" method="post" id="rang">
    </form>
    <script type="text/javascript">
        var rating = <c:out value="${rating}" default="0"/>;
        rating = Math.round(rating);
        for (i = 0; i < rating; i++) {
            $("#rang").append('<input type="image" src="/lib/css/images/fill_like.png" value=' + i + '' + '/> ');
        }
        while (i < 10) {
            $("#rang").append('<input type="image" src="/lib/css/images/like.png" value=' + i + '/> ');
            i++;
        }
    </script>
</div>