<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="left-sidebar-pro">
    <nav id="sidebar" class="">
        <div class="sidebar-header">
            <a href="participant-dashboard">
                <img class="main-logo" src="${pageContext.request.contextPath}/img/logo/logo.png" alt="CodeVerse" />
            </a>
            <strong><img src="img/logo/logosn.png" alt="CV" /></strong>
        </div>

        <div class="nalika-profile">
            <div class="profile-dtl">
                <a href="viewProfile">
                    <img src="${not empty sessionScope.user.profilePicURL ? sessionScope.user.profilePicURL : 'img/notification/4.jpg'}" alt="Profile" />
                </a>
                <h2>${sessionScope.user.firstName} <span class="min-dtn">Participant</span></h2>
            </div>
        </div>

        <div class="left-custom-menu-adp-wrap comment-scrollbar">
            <nav class="sidebar-nav left-sidebar-menu-pro">
                <ul class="metismenu" id="menu1">
                    
                    <li class="active">
                        <a title="Workspace" href="participant-dashboard">
                            <i class="fa fa-th-large icon-wrap"></i>
                            <span class="mini-click-non">Workspace</span>
                        </a>
                    </li>

                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false">
                            <i class="fa fa-rocket icon-wrap"></i> 
                            <span class="mini-click-non">Hackathons</span>
                        </a>
                        <ul class="submenu-angle collapse" aria-expanded="false">
                            <li><a title="Browse All" href="browse-hackathons"><span class="mini-sub-pro">Explore Events</span></a></li>
                            <li><a title="My Registrations" href="my-hackathons"><span class="mini-sub-pro">My Participations</span></a></li>
                            <li><a title="Past Events" href="past-events"><span class="mini-sub-pro">Past History</span></a></li>
                        </ul>
                    </li>

                    <li>
                        <a title="My Team" href="manage-teams" aria-expanded="false">
                            <i class="fa fa-users icon-wrap"></i> 
                            <span class="mini-click-non">Team Workspace</span>
                        </a>
                    </li>

                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false">
                            <i class="icon nalika-diamond icon-wrap"></i> 
                            <span class="mini-click-non">Rewards</span>
                        </a>
                        <ul class="submenu-angle collapse" aria-expanded="false">
                            <li><a title="Certificates" href="my-certificates"><span class="mini-sub-pro">Certificate Vault</span></a></li>
                            <li><a title="Badges" href="my-badges"><span class="mini-sub-pro">Skill Badges</span></a></li>
                            <li><a title="Leaderboard" href="global-leaderboard"><span class="mini-sub-pro">Global Ranking</span></a></li>
                        </ul>
                    </li>

                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false">
                            <i class="icon nalika-user icon-wrap"></i> 
                            <span class="mini-click-non">Account</span>
                        </a>
                        <ul class="submenu-angle collapse" aria-expanded="false">
                            <li><a title="My Profile" href="viewProfile"><span class="mini-sub-pro">View Profile</span></a></li>
                            <li><a title="Edit Profile" href="editUser?userId=${sessionScope.user.userId}"><span class="mini-sub-pro">Update Info</span></a></li>
                        </ul>
                    </li>

                    <li>
                        <a title="Logout" href="${pageContext.request.contextPath}/logout" style="color: #fe5e5e;">
                            <i class="fa fa-sign-out icon-wrap"></i>
                            <span class="mini-click-non">Sign Out</span>
                        </a>
                    </li>

                </ul>
            </nav>
        </div>
    </nav>
</div>