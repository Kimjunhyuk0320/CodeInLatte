$(document).ready(function() {
    $(window).scroll(function() {
        var scrollValue = $(document).scrollTop()
        console.log(scrollValue)
        if(scrollValue > 350) {
            $(".code_section_main_con").fadeOut();
            $(".code_footer").fadeIn();
            $(".code_footer_main_design").css({ 'color' : 'white'});
        }
        if(scrollValue <= 350) {
            $(".code_section_main_con").fadeIn();
            $(".code_footer").fadeOut();
        }

        var $pages = $('.skw-page');
        var currentPageIndex = 0;
        var lastScrollTop = 0;
        var divTop = document.querySelector(".code_section_sub2").offsetTop;
        var shouldExecute = true;
        
        function checkPage(index) {
            console.log('Checking page', index);
            console.log(`페이지 길이는 : ${$pages.length-$pages.length}`)
            console.log(`페이지 길이는 : ${$pages.length}`)
            
        }
        $(window).on("scroll", function() {
            var st = $(this).scrollTop();
            console.log(`스크롤 위치 : ${st}`)
            console.log(`스큐 박스 시작점 : ${divTop}`)
            if (st === divTop){
                $('body').css('overflow', 'hidden');
                // downscroll code
                currentPageIndex++;
                var curPage = 1;
                var numOfPages = $(".skw-page").length;
                var animTime = 1000;
                var scrolling = false;
                var pgPrefix = ".skw-page-";
                
                console.log('시작 페이지 : ' + curPage )
                console.log('마지막 페이지 : ' +  numOfPages )
                function pagination() {
                    scrolling = true;
                    
                    $(pgPrefix + curPage).removeClass("inactive").addClass("active");
                    $(pgPrefix + (curPage - 1)).addClass("inactive");
                    $(pgPrefix + (curPage + 1)).removeClass("active");
                
                    setTimeout(function() {
                        scrolling = false;
                    }, animTime);
                    };
                
                    function navigateUp() {
                    if (curPage === 1) return;
                    curPage--;
                    pagination();
                };
                
                function navigateDown() {
                    if (curPage === numOfPages) return;
                    curPage++;
                    pagination();
                    };
                
                    $(document).on("mousewheel DOMMouseScroll", function(e) {
                        if (scrolling) return;
                        if (e.originalEvent.wheelDelta > 0 || e.originalEvent.detail < 0) {
                            navigateUp();
                        } else { 
                            navigateDown();
                        }

                        if(curPage === numOfPages) {
                            $('body').css('overflow', 'auto');
                            $('.code_section_sub3').addClass('active');
                            $('.code_section_sub3').removeClass('none');
                        }

                        if(curPage === 1) {
                            $('body').css('overflow', 'auto');
                        }
                    });
                }
        });
    })
})