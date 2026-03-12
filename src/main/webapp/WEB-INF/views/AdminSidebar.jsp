<style>
  .logo-icon-img {
    height: 70px;
    width: auto;
    max-width: 100%;
    object-fit: contain;
    display: block;
   }
     * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #f5f7fb;
            color: #1e293b;
        }

        /* Layout */
        .app-wrapper {
            display: flex;
            min-height: 100vh;
        }

        /* Sidebar */
        .sidebar {
            width: 260px;
            background: linear-gradient(180deg, #0f172a 0%, #1e293b 100%);
            color: #e2e8f0;
            transition: width 0.3s ease;
            display: flex;
            flex-direction: column;
            box-shadow: 4px 0 20px rgba(0,0,0,0.08);
        }

        .sidebar.collapsed {
            width: 80px;
        }

        .sidebar-header {
            padding: 24px 20px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid rgba(255,255,255,0.1);
        }

        .logo-area {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .logo-icon {
            background: #3b82f6;
            width: 36px;
            height: 36px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
            font-weight: 700;
            color: white;
        }

        .logo-text {
            font-size: 1.25rem;
            font-weight: 600;
            color: white;
            letter-spacing: 0.5px;
            white-space: nowrap;
        }

        .sidebar.collapsed .logo-text {
            display: none;
        }

        .toggle-btn {
            background: rgba(255,255,255,0.1);
            border: none;
            color: #cbd5e1;
            width: 32px;
            height: 32px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: 0.2s;
        }

        .toggle-btn:hover {
            background: rgba(255,255,255,0.2);
            color: white;
        }

        .sidebar.collapsed .toggle-btn i {
            transform: rotate(180deg);
        }

        /* Sidebar Menu */
        .sidebar-menu {
            flex: 1;
            padding: 20px 0;
        }

        .menu-item {
            display: flex;
            align-items: center;
            padding: 12px 24px;
            margin: 4px 8px;
            border-radius: 12px;
            color: #cbd5e1;
            transition: 0.2s;
            white-space: nowrap;
        }

        .menu-item i {
            font-size: 1.25rem;
            min-width: 36px;
        }

        .menu-item span {
            margin-left: 8px;
            font-weight: 500;
        }

        .menu-item:hover, .menu-item.active {
            background: rgba(59, 130, 246, 0.2);
            color: white;
        }

        .sidebar.collapsed .menu-item span {
            display: none;
        }

        .sidebar.collapsed .menu-item {
            justify-content: center;
            padding: 12px 0;
        }
  }

  /* Sidebar menu & submenu styles */
  .menu-item {
    display: flex;
    align-items: center;
    padding: 12px 24px;
    margin: 4px 8px;
    border-radius: 12px;
    color: #cbd5e1;
    transition: 0.2s;
    white-space: nowrap;
    cursor: pointer;
    position: relative;
  }

  .menu-item i:first-child {
    font-size: 1.25rem;
    min-width: 36px;
  }

  .menu-item span {
    margin-left: 8px;
    font-weight: 500;
    flex: ; /* takes up remaining space, pushing arrow to the right */
  }

  .menu-item .arrow-icon {
    font-size: 0.9rem;
    transition: transform 0.3s;
    margin-left: auto; /* ensures arrow stays at the far right */
  }

 .menu-item.open .arrow-icon {
    transform: rotate(-90deg);
  }

  .menu-item:hover,
  .menu-item.active {
    background: rgba(59, 130, 246, 0.2);
    color: white;
  }

  .submenu {
    list-style: none;
    padding-left: 56px;
    max-height: 0;
    overflow: hidden;
    transition: max-height 0.3s ease;
  }

  .submenu.open {
    max-height: 200px;
  }

  .submenu-item {
    padding: 10px 0 10px 12px;
    margin: 2px 8px 2px 0;
    border-radius: 10px;
    color: #a0afc0;
    font-size: 0.95rem;
    cursor: pointer;
    white-space: nowrap;
  }

  .submenu-item:hover {
    color: white;
    background: rgba(255, 255, 255, 0.05);
  }

  .submenu-item i {
    margin-right: 10px;
    font-size: 1rem;
    width: 20px;
  }

  /* Collapsed sidebar adjustments */
  .sidebar.collapsed .menu-item span,
  .sidebar.collapsed .menu-item .arrow-icon {
    display: none;
  }

  .sidebar.collapsed .submenu {
    display: none;
  }
  a{
    color:white;
     text-decoration: none;
  }
</style>

<!-- Sidebar -->
<aside class="sidebar" id="sidebar">
  <div class="sidebar-header">
    <div class="logo-area">
      <img alt="CodeVerse Logo" src="img/logo/logo1.png" class="logo-icon-img">
      <span class="logo-text">CodeVerse</span>
    </div>
    <button class="toggle-btn" id="toggleSidebar">
      <i class="fas fa-chevron-left"></i>
    </button>
  </div>

  <div class="sidebar-menu">
    <!-- Dashboard -->
    <div class="menu-item active">
      <i class="fas fa-th-large"></i>
      <a href="/dashboard"> <span>Dashboard</span></a>
    </div>

    <!-- Hackathons with submenu & arrow -->
    <div class="menu-item" id="hackathonMenu">
      <i class="fas fa-calendar-alt"></i>
      <span>Hackathons</span>
      <i class="fas fa-chevron-left arrow-icon"></i>
    </div>
    <ul class="submenu" id="hackathonSubmenu">
      <li class="submenu-item"><i class="fas fa-plus-circle"><a href = "/create-hackathon"></i> Add Hackathon</li></a>
      <li class="submenu-item"><i class="fas fa-list"><a href="/listHackathon"></i> List Hackathons</li></a>
    </ul>

    <!-- Other menu items -->
    <div class="menu-item" id="userMenu">
      <i class="fas fa-users"></i>
      <span>Users</span>
       <i class="fas fa-chevron-left arrow-icon"></i>
    </div>
     <ul class="submenu" id="userSubmenu">
      <li class="submenu-item"><i class="fas fa-plus-circle"><a href = "/create-hackathon"></i> Add User</li></a>
       <li class="submenu-item"><i class="fas fa-tag"></i> <a href="newUserType">Add User Type</a></li>
      <li class="submenu-item"><i class="fas fa-list"><a href="listUser"></i> List Users</li></a>
    </ul>
    
      <!-- Category with submenu (new) -->
    <div class="menu-item" id="categoryMenu">
      <i class="fas fa-folder"></i>
      <span>Category</span>
      <i class="fas fa-chevron-left arrow-icon"></i>
    </div>
    <ul class="submenu" id="categorySubmenu">
      <li class="submenu-item"><i class="fas fa-plus-circle"></i> <a href="newCategory">Add Category</a></li>
      <li class="submenu-item"><i class="fas fa-list"></i> <a href="listCategory">List Categories</a></li>
    </ul>
    
    <div class="menu-item">
      <i class="fas fa-user-tie"></i>
      <span>Organizers</span>
    </div>
    <div class="menu-item">
      <i class="fas fa-check-circle"></i>
      <span>Approvals</span>
    </div>
    <div class="menu-item">
      <i class="fas fa-cog"></i>
      <span>Settings</span>
    </div>
  </div>

  <div class="sidebar-footer" style="padding: 20px;">
    <!-- optional -->
  </div>
</aside>

<script>
  const sidebar = document.getElementById('sidebar');
  const toggleBtn = document.getElementById('toggleSidebar');
  const hackathonMenu = document.getElementById('hackathonMenu');
  const hackathonSubmenu = document.getElementById('hackathonSubmenu');

  // Sidebar collapse/expand
  toggleBtn.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
    const icon = toggleBtn.querySelector('i');
    if (sidebar.classList.contains('collapsed')) {
      icon.classList.remove('fa-chevron-left');
      icon.classList.add('fa-chevron-right');
      // Close any open submenus when collapsing
      document.querySelectorAll('.menu-item.open').forEach(item => item.classList.remove('open'));
      document.querySelectorAll('.submenu.open').forEach(sub => sub.classList.remove('open'));
    } else {
      icon.classList.remove('fa-chevron-right');
      icon.classList.add('fa-chevron-left');
    }
  });

  // Hackathon submenu toggle
  hackathonMenu.addEventListener('click', (e) => {
    e.stopPropagation();
    // Only toggle if sidebar is expanded
    if (!sidebar.classList.contains('collapsed')) {
      hackathonMenu.classList.toggle('open');
      hackathonSubmenu.classList.toggle('open');
    }
  });
  userMenu.addEventListener('click', (e) => {
	    e.stopPropagation();
	    // Only toggle if sidebar is expanded
	    if (!sidebar.classList.contains('collapsed')) {
	     userMenu.classList.toggle('open');
	     userSubmenu.classList.toggle('open');
	    }
	  });
  categoryMenu.addEventListener('click', (e) => {
	    e.stopPropagation();
	    if (!sidebar.classList.contains('collapsed')) {
	      categoryMenu.classList.toggle('open');
	      categorySubmenu.classList.toggle('open');
	    }
	  });
</script>