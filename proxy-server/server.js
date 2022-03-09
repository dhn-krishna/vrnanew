const Koa = require("koa");
const cors = require("@koa/cors");
const proxy = require("koa-proxies");
const app = new Koa();
const port = process.env.PORT || 3000;

app.use(cors());

app.use(
  proxy("/", {
    target: "http://ec2-3-21-205-116.us-east-2.compute.amazonaws.com:8089",
    changeOrigin: true,
    logs: true,
  })
);

app.listen(port);
console.log(`listening on port ${port}`);