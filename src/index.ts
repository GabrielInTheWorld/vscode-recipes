import * as http from "http";

import { h } from "./hello";

let reqCnt = 1;

http
	.createServer((req, res) => {
		const message = `Request Count: ${reqCnt}`;

		res.writeHead(200, { "Content-Type": "text/html" });
		res.end(
			`<html><head><meta http-equiv="refresh" content="2"></head><body>${message}</body></html>`
		);

		h();
		h();
		console.log("handled request: " + reqCnt++);
	})
	.listen(3000);

console.log("Hello World");
console.log("Hello World from docker");
console.log("server running on port 3000");
