document.addEventListener("DOMContentLoaded", function (event) {
    const showNavbar = (toggleId, navId, bodyId, headerId) => {
        const toggle = document.getElementById(toggleId),
            nav = document.getElementById(navId),
            bodypd = document.getElementById(bodyId),
            headerpd = document.getElementById(headerId)

        // Validate that all variables exist
        if (toggle && nav && bodypd && headerpd) {
            toggle.addEventListener('click', () => {
                // show navbar
                nav.classList.toggle('show')
                // change icon
                toggle.classList.toggle('bx-x')
                // add padding to body
                bodypd.classList.toggle('body-pd')
                // add padding to header
                headerpd.classList.toggle('body-pd')
            })
        }
    }
    
    
    let mainMenuData=null;
    let mainMenuArray = null;


    // Function to fetch the JSON data from the API
    async function fetchMenuData(url, requestBody) {
    
        try {
            const response = await fetch(url, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(requestBody)
            });
    
            if (!response.ok) {
                throw new Error('Network response was not ok');
            }
    
            const jsonData = await response.json();
            return jsonData;
        } catch (error) {
            console.error('Error fetching data:', error);
            return null;
        }
    }
    
  

    async function main(custRole) {
        try {
        const requestBody = {
            "custRole": custRole,
            "ustKid": ustKid,
            "Origin": "IB"
        };
        mainMenuData = await fetchMenuData("/rest/AccountService/getMenu/", requestBody);
        console.log('JSON Response:', mainMenuData);
        console.log(mainMenuData.menus);
        const firstMenu = mainMenuData.menus[0].name;

        var mainItems = document.getElementById('level_1_menus');

        const menuNames = mainMenuData.menus.map(menu => {
            var link = "#";
            if(menu.link && menu.link!="0") link = menu.link;
            var menuItem = `<li class="nav-item" id="${menu.name}">
                                <a class="nav-link text-primary" href="${link}">${menu.name}</a>
                            </li>`
            mainItems.innerHTML+=menuItem;
            console.log(menu.name);
        });
        console.log("First Menu is: ",firstMenu);
        renderSideMenus(custRole);
        console.log(mainMenuData.menus.length);
        var prevMenu = localStorage.getItem('prevMenu')
        if(prevMenu){
            document.getElementById(prevMenu).click();
        }else{
            document.getElementById(firstMenu).click();
        }
        } catch (error) {
        console.error('Error:', error);
        }
    }
    console.log("custRole is", custRole)
    main(custRole);

    showNavbar('header-toggle', 'nav-bar', 'body-pd', 'header')

    /*===== LINK ACTIVE =====*/
    const linkColor = document.querySelectorAll('.nav_link')

    function colorLink() {
        if (linkColor) {
            linkColor.forEach(l => l.classList.remove('active'))
            this.classList.add('active')
        }
    }
    linkColor.forEach(l => l.addEventListener('click', colorLink))


    function renderSideMenus(custRole){
        const navItems = document.getElementsByClassName('nav-item');
        var sideItems = document.getElementsByClassName('side-item');
        // Convert the HTMLCollection to an array
        const navItemsArray = Array.from(navItems);
        navItemsArray.forEach(navItem => {
            navItem.addEventListener('click', async () => {
                // document.getElementById("header-toggle").click();
                console.log('Clicked:', navItem.textContent);
                var side_item = document.getElementById('side_menus');
                side_item.innerHTML = ""; // Clear any existing content
                const clickedNavItem = navItem.textContent.trim();
                localStorage.setItem('prevMenu', clickedNavItem);
                console.log(clickedNavItem);
                var lvlNo = "";
                const menuNames = mainMenuData.menus.map(menu => {
                    if(clickedNavItem===menu.name){
                        lvlNo = menu.LvlSno;
                    }

                });
                console.log(lvlNo);

                const requestBody = {
                    "custRole":custRole,
                    "ustKid":ustKid,
                    "LvlNo":lvlNo
                }

                try {
                    const sideMenuData = await fetchMenuData("/rest/AccountService/getChildMenu/", requestBody);
                    console.log(sideMenuData);
                    const selectedArray = mainMenuData[clickedNavItem];
                    const sideMenuNames = await Promise.all(sideMenuData.menus.map(menu => {
                        console.log(menu);
                        const navLink = document.createElement('a');
                        navLink.href = menu.link;
                        navLink.className = "nav_link side-item";
            
                        const navIcon = document.createElement('i');
                        navIcon.className = "bx bx-grid-alt nav_icon";
            
                        const navName = document.createElement('span');
                        navName.className = "nav_name";
                        navName.textContent = menu.name;
            
                        navLink.appendChild(navIcon);
                        navLink.appendChild(navName);
                        
                        navLink.onclick = () => {
                            if(!menu.link) renderHTMLIntoDiv("./DemoPages/errorPage.html");
                        };
                        side_item.appendChild(navLink);
                    
                    }));
                } catch (error) {
                    console.error('Error fetching data:', error);
                }
            });
        });
    }


//   console.log("Jq running");

//   $('#targetDiv').on('click', 'a', function(event) {
//     event.preventDefault(); // Prevent the default behavior of link clicks

//     var linkPath = $(this).attr('href');

//     renderHTMLIntoDiv(linkPath);
//   });



  
});

function toggleProfileMenu() {
    debugger;
    var profileMenu = document.getElementById("profileMenuTop");
    if(profileMenu.style.display === "none") {
      profileMenu.style.display = "block";
    } else {
      profileMenu.style.display = "none";

    }
}



function renderHTMLIntoDiv(path) {
    $.ajax({
      url: path,
      dataType: 'html',
      success: function(response) {
        $('#targetDiv').html(response);
      }
    });
}
