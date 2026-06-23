--
-- PostgreSQL database dump
--

\restrict gjlZVHQurHzwEwM6b2Y7dkWGSotAfutNTecQoeFguXcPW1AhfNfYNfvmvrZqVAU

-- Dumped from database version 16.10
-- Dumped by pg_dump version 16.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: __drizzle_migrations; Type: TABLE DATA; Schema: drizzle; Owner: -
--

COPY drizzle.__drizzle_migrations (id, hash, created_at) FROM stdin;
1	954376a5bd1c3a6b286d64d9bb9ba1c03cf519257ad0455191440ce0b1bba2f1	1774511409979
\.


--
-- Data for Name: custom_actions; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.custom_actions (id, label, description, prompt) FROM stdin;
\.


--
-- Data for Name: doc_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.doc_templates (id, titulo, categoria, conteudo, docx_base64, docx_filename) FROM stdin;
\.


--
-- Data for Name: ementas; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.ementas (id, titulo, categoria, texto) FROM stdin;
\.


--
-- Data for Name: prompt_templates; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.prompt_templates (id, titulo, categoria, texto) FROM stdin;
\.


--
-- Data for Name: snippets; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.snippets (id, title, html, css, js, mode) FROM stdin;
0111a8b6-3378-4c3b-bca6-fd200d04dcc0	Cartao de Perfil	<div class="profile-card">\n  <div class="avatar">JD</div>\n  <h2>Joao da Silva</h2>\n  <p class="role">Desenvolvedor Frontend</p>\n  <div class="stats">\n    <div><strong>142</strong><span>Projetos</span></div>\n    <div><strong>1.2k</strong><span>Seguidores</span></div>\n    <div><strong>89</strong><span>Repos</span></div>\n  </div>\n  <button onclick="this.textContent='Seguindo!'">Seguir</button>\n</div>	* { margin:0; padding:0; box-sizing:border-box; }\nbody { font-family:'Segoe UI',sans-serif; display:flex; align-items:center; justify-content:center; min-height:100vh; background:#0f172a; }\n.profile-card { background:#1e293b; border-radius:16px; padding:2rem; text-align:center; color:#e2e8f0; width:320px; box-shadow:0 25px 50px rgba(0,0,0,0.3); }\n.avatar { width:80px; height:80px; border-radius:50%; background:linear-gradient(135deg,#6366f1,#8b5cf6); display:flex; align-items:center; justify-content:center; margin:0 auto 1rem; font-size:1.5rem; font-weight:700; }\nh2 { font-size:1.3rem; margin-bottom:0.3rem; }\n.role { color:#94a3b8; font-size:0.9rem; margin-bottom:1.5rem; }\n.stats { display:flex; justify-content:space-around; margin-bottom:1.5rem; }\n.stats div { display:flex; flex-direction:column; }\n.stats strong { font-size:1.2rem; }\n.stats span { font-size:0.75rem; color:#94a3b8; }\nbutton { width:100%; padding:0.6rem; background:#6366f1; color:#fff; border:none; border-radius:8px; font-size:0.95rem; cursor:pointer; transition:background 0.2s; }\nbutton:hover { background:#4f46e5; }	console.log("Cartao de perfil carregado!");	html
0a9fde4f-95a5-4238-9a42-1986232e6e32	Contador Animado	<div class="counter-app">\n  <h1>Contador</h1>\n  <div class="display" id="count">0</div>\n  <div class="buttons">\n    <button onclick="decrement()">-</button>\n    <button onclick="reset()">Reset</button>\n    <button onclick="increment()">+</button>\n  </div>\n</div>	* { margin:0; padding:0; box-sizing:border-box; }\nbody { font-family:'Segoe UI',sans-serif; display:flex; align-items:center; justify-content:center; min-height:100vh; background:linear-gradient(135deg,#1a1a2e,#16213e); color:#fff; }\n.counter-app { text-align:center; }\nh1 { font-size:1.5rem; letter-spacing:2px; text-transform:uppercase; opacity:0.7; margin-bottom:1rem; }\n.display { font-size:5rem; font-weight:800; margin:1rem 0; transition:transform 0.15s; }\n.buttons { display:flex; gap:1rem; }\nbutton { padding:0.8rem 1.5rem; font-size:1.2rem; border:none; border-radius:12px; cursor:pointer; font-weight:600; transition:transform 0.1s; }\nbutton:active { transform:scale(0.95); }\nbutton:first-child { background:#ef4444; color:#fff; }\nbutton:nth-child(2) { background:#6b7280; color:#fff; }\nbutton:last-child { background:#22c55e; color:#fff; }	let count = 0;\nconst display = document.getElementById('count');\nfunction increment() { count++; display.textContent = count; display.style.transform='scale(1.1)'; setTimeout(()=>display.style.transform='scale(1)',150); }\nfunction decrement() { count--; display.textContent = count; display.style.transform='scale(0.9)'; setTimeout(()=>display.style.transform='scale(1)',150); }\nfunction reset() { count=0; display.textContent=count; }	html
d6263962-29f7-4fd7-b739-15f5ae8852df	Lista de Tarefas	<div class="todo-app">\n  <h1>Minhas Tarefas</h1>\n  <div class="input-row">\n    <input type="text" id="taskInput" placeholder="Nova tarefa..." />\n    <button onclick="addTask()">Adicionar</button>\n  </div>\n  <ul id="taskList"></ul>\n</div>	* { margin:0; padding:0; box-sizing:border-box; }\nbody { font-family:'Segoe UI',sans-serif; display:flex; align-items:center; justify-content:center; min-height:100vh; background:#fafaf9; }\n.todo-app { background:#fff; border-radius:16px; padding:2rem; width:380px; box-shadow:0 4px 24px rgba(0,0,0,0.08); }\nh1 { font-size:1.4rem; color:#1c1917; margin-bottom:1.2rem; }\n.input-row { display:flex; gap:0.5rem; margin-bottom:1rem; }\ninput { flex:1; padding:0.6rem 0.8rem; border:1px solid #d6d3d1; border-radius:8px; font-size:0.9rem; outline:none; }\ninput:focus { border-color:#6366f1; box-shadow:0 0 0 3px rgba(99,102,241,0.1); }\nbutton { padding:0.6rem 1rem; background:#6366f1; color:#fff; border:none; border-radius:8px; cursor:pointer; font-size:0.9rem; }\nul { list-style:none; }\nli { display:flex; align-items:center; gap:0.5rem; padding:0.6rem 0; border-bottom:1px solid #f5f5f4; cursor:pointer; }\nli.done span { text-decoration:line-through; color:#a8a29e; }\n.dot { width:8px; height:8px; border-radius:50%; background:#6366f1; flex-shrink:0; }\nli.done .dot { background:#a8a29e; }	function addTask() {\n  const input = document.getElementById('taskInput');\n  const val = input.value.trim();\n  if (!val) return;\n  const li = document.createElement('li');\n  li.innerHTML = '<span class="dot"></span><span>' + val + '</span>';\n  li.onclick = () => li.classList.toggle('done');\n  document.getElementById('taskList').appendChild(li);\n  input.value = '';\n}\ndocument.getElementById('taskInput').addEventListener('keydown', e => { if(e.key==='Enter') addTask(); });	html
\.


--
-- Name: __drizzle_migrations_id_seq; Type: SEQUENCE SET; Schema: drizzle; Owner: -
--

SELECT pg_catalog.setval('drizzle.__drizzle_migrations_id_seq', 1, true);


--
-- PostgreSQL database dump complete
--

\unrestrict gjlZVHQurHzwEwM6b2Y7dkWGSotAfutNTecQoeFguXcPW1AhfNfYNfvmvrZqVAU

