<!--::::: HEADER AREA START :::::::-->
<div class="header-area" id="header">
    <!--scroll to up btn-->
    <a href="#home" class="up-btn"><i class="fal fa-angle-up"></i></a>
    <div class="container">
        <div class="row">
            <div class="col-6 col-lg-3 align-self-center">
                <h3 style="color: #08d665; font-size: 30px;">Advaultmetrics</h3>
                <!-- <a href="index.php" class="logo"><img src="assets/img/logo/logo.png" alt=""></a> -->
            </div>
            <!-- <div class="col-6 text-center align-self-center">
                            <div class="main-menu">
                                <div class="stellarnav">
                                    <ul class="navbarmneuclass">
                                        <li><a href="index.php">Home</a></li>
                                        <li><a href="about.php">About</a></li>
                                        <li><a href="index.php#service">Service</a></li>
                                        <li><a href="index.php#Project">Projects</a></li>
                                        <li><a href="contact.php">Contact Us</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div> -->
            
        </div>
    </div>
    <div class="slide-widgest-wrap" id="slide-widgest">
        <div class="side-widgest" id="side-content">
            <div class="side-close" id="close-btn">
                <i class="fal fa-times"></i>
            </div>
            <div class="logo">
                <h3 style="color: #08d665; font-size: 30px;">Advaultmetrics</h3>
            </div>
            <div class="side-content">
                <!-- <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint ratione reprehenderit, error qui enim sit ex provident iure, dolor, nulla eaque delectus, repudiandae commodi. Velit assumenda odit quisquam at, error suscipit unde, necessitatibus ipsum ratione excepturi ducimus labore, totam dolorem.</p> -->
            </div>
            <div class="side-social">
                <ul class="navbarmneuclass">
                    <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                    <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                    <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                    <li><a href="#"><i class="fab fa-instagram"></i></a></li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!--::::: HEADER AREA END :::::::-->

<script>
    $(document).ready(function() {
        // Retrieve the last clicked link from local storage and add 'current' class
        var lastClickedLink = localStorage.getItem('lastClickedLink');
        if (lastClickedLink) {
            $('.navbarmneuclass li:has(a[href="' + lastClickedLink + '"])').addClass('current');
        }

        // Handle click event on list items
        $('.navbarmneuclass li').click(function() {
            // Remove 'current' class from all list items
            $('.navbarmneuclass li').removeClass('current');

            // Add 'current' class to the clicked list item
            $(this).addClass('current');

            // Store the href attribute of the clicked link in local storage
            var clickedLink = $(this).find('a').attr('href');
            localStorage.setItem('lastClickedLink', clickedLink);
        });
    });
</script>