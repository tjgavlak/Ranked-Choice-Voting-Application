import Vue from 'vue'
import Router from 'vue-router'
import Home from '../views/Home.vue'
import Login from '../views/Login.vue'
import Logout from '../views/Logout.vue'
import Register from '../views/Register.vue'
import store from '../store/index'
import ActiveIssues from '../views/ActiveIssues.vue'
import IssueDetails from '../views/IssueDetails.vue'
import ProposeIssue from '../views/ProposeIssue.vue'
import SecondIssueForm from '../views/SecondIssueForm.vue'
import CompletedIssues from '../views/CompletedIssues.vue'
import CompletedIssueDetails from '../views/CompletedIssueDetails.vue'
import PostedIssue from '../views/PostedIssue.vue'
import EditAnIssue from '../views/EditAnIssue.vue'

Vue.use(Router)

/**
 * The Vue Router is used to "direct" the browser to render a specific view component
 * inside of App.vue depending on the URL.
 *
 * It also is used to detect whether or not a route requires the user to have first authenticated.
 * If the user has not yet authenticated (and needs to) they are redirected to /login
 * If they have (or don't need to) they're allowed to go about their way.
 */

const router = new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/login",
      name: "login",
      component: Login,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/logout",
      name: "logout",
      component: Logout,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/register",
      name: "register",
      component: Register,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/issues/active",
      name: "active-issues",
      component: ActiveIssues,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/issues/active/:issueId",
      name: "issue-details",
      component: IssueDetails,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/issues",
      name: "proposal-form",
      component: ProposeIssue,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/issues/choices/:issueId",
      name: "choice",
      component: SecondIssueForm,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/issues/completed",
      name: "completed-issues",
      component: CompletedIssues,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/issues/completed/:issueId",
      name: "completed-issue-details",
      component: CompletedIssueDetails,
      meta: {
        requiresAuth: false
      }
    },
    {
      path: "/issues/choices",
      name: "posted-issue",
      component: PostedIssue,
      meta: {
        requiresAuth: true
      }
    },
    {
      path: "/issues/edit/:issueId",
      name: "edit-issue",
      component: EditAnIssue,
      meta: {
        requiresAuth: true
      }
    }
  ]
})

router.beforeEach((to, from, next) => {
  // Determine if the route requires Authentication
  const requiresAuth = to.matched.some(x => x.meta.requiresAuth);

  // If it does and they are not logged in, send the user to "/login"
  if (requiresAuth && store.state.token === '') {
    next("/login");
  } else {
    // Else let them go to their next destination
    next();
  }
});

export default router;
