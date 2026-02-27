import { readFileSync } from "fs";

const routes = {
    "/health": {
        GET: (request: Request) => new Response("OK"),
    },
    "/run": {
        GET: (request: Request) => new Response("Running"),
    },
}

Bun.serve({
    port: 8081,
    routes,
    fetch(req) {
        const url = new URL(req.url);

        if (url.pathname === "/") {
            const html = readFileSync("./srcs/index.html", "utf8");
            return new Response(html, {
                headers: { "Content-Type": "text/html" },
            });
        }
        else return new Response("Not Found", { status: 404 });
    }
})
