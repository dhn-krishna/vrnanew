import DashboardModule from "../views/DashboardModule";
import ContentsModule from "../views/Contents/Contents";
import AddContentModule from "../views/AddContent/AddContent";
import AnalyticsModule from "../views/Analytics/Analytics";
import WalletModule from "../views/Wallet/Wallet";
import Login from "../auth/login/Login";

var routes = [
  {
    path: "/home",
    name: "Dashboard",
    icon: "ni ni-tv-2 text-primary",
    component: DashboardModule,
    layout: "/admin",
  },
  {
    path: "/content",
    name: "Contents",
    icon: "ni ni-planet text-blue",
    component: ContentsModule,
    layout: "/admin",
  },
  {
    path: "/add-content",
    name: "Add Content",
    icon: "ni ni-pin-3 text-orange",
    component: AddContentModule,
    layout: "/admin",
  },
  {
    path: "/analytics",
    name: "Analytics",
    icon: "ni ni-single-02 text-yellow",
    component: AnalyticsModule,
    layout: "/admin",
  },
  {
    path: "/tables",
    name: "Wallet",
    icon: "ni ni-bullet-list-67 text-red",
    component: WalletModule,
    layout: "/admin",
  },
  {
    path: "/login",
    name: "Login",
    icon: "ni ni-key-25 text-info",
    component: Login,
    layout: "/auth",
  },
];
export default routes;
