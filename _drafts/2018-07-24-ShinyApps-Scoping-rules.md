---
title: ShinyApps Scoping rules
date: 2018-07-24
categories: Study
tags:
- Shiny
---

## Three different levels

This note referenced from [Scoping rules for Shiny apps][https://shiny.rstudio.com/articles/scoping.html]

1. Visible with the `server` code of each user session
2. Visible with the `server`code across all sessions, that's to say : multiple users could use a shared variable.
3. Visible in the `server`code and the `ui`code across all user sessions.

<u>***Note***</u>: One R process can support multiple shiny session, but but between the R processes, *no* objects are shared.