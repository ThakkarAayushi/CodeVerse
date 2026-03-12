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
    cursor: pointer;
  }

  .menu-item i {
    font-size: 1.25rem;
    min-width: 36px;
  }

  .menu-item span {
    margin-left: 8px;
    font-weight: 500;
  }

  .menu-item:hover,
  .menu-item.active {
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

  a {
    color: white;
    text-decoration: none;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
  }

  .menu-item a {
    display: flex;
    align-items: center;
    width: 100%;
  }

  /* No submenus for participant, so we can remove related styles if desired */
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
      <a href="/participant/participant-dashboard">
        <i class="fas fa-th-large"></i>
        <span>Dashboard</span>
      </a>
    </div>

    <!-- My Hackathons -->
    <div class="menu-item">
      <a href="/participant/my-hackathons">
        <i class="fas fa-calendar-alt"></i>
        <span>My Hackathons</span>
      </a>
    </div>

    <!-- My Team -->
    <div class="menu-item">
      <a href="/participant/my-team">
        <i class="fas fa-users"></i>
        <span>My Team</span>
      </a>
    </div>

    <!-- Profile -->
    <div class="menu-item">
      <a href="/participant/profile">
        <i class="fas fa-user-circle"></i>
        <span>Profile</span>
      </a>
    </div>

    <!-- Logout -->
    <div class="menu-item">
      <a href="/logout">
        <i class="fas fa-sign-out-alt"></i>
        <span>Logout</span>
      </a>
    </div>
  </div>

  <div class="sidebar-footer" style="padding: 20px;">
    <!-- optional -->
  </div>
</aside>

<script>
  const sidebar = document.getElementById('sidebar');
  const toggleBtn = document.getElementById('toggleSidebar');

  // Sidebar collapse/expand
  toggleBtn.addEventListener('click', () => {
    sidebar.classList.toggle('collapsed');
    const icon = toggleBtn.querySelector('i');
    if (sidebar.classList.contains('collapsed')) {
      icon.classList.remove('fa-chevron-left');
      icon.classList.add('fa-chevron-right');
    } else {
      icon.classList.remove('fa-chevron-right');
      icon.classList.add('fa-chevron-left');
    }
  });
</script>