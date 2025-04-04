# Copilot Instructions: Trusty Owl Landing Page 

## Project Goal

Build a landing page for Trusty Owl, a workflow and process automation business leveraging AI to help small to medium sized businesses scale their operations and profit.  

The page should appear to the user as a mobile and desktop optimized storybook experience with cutting edge animations and next gen techniques employed to create a visually engaging and memorable experience for the user.  

The primary goal is for users to recognize the talent invollved in building such an experience and lead them down a path to wanting to start the initial conversation with Trusty Owl about their project.   

## Core Functionality

## Technology Stack

* **Frontend:** Node.js, Vite, Vue.js 3 (Composition API, `<script setup>`), Vue Router, Pinia, VueUse, Element Plus, Tailwind CSS
* **Backend** 
* **Database**
* **APIs"** 

## Project Structure

## Vite + Vue 3 Setup

The `trustyowl-site` directory has been initialized with a Vite project using the Vue 3 template. The project is configured to use the Vue 3 Composition API and follows best practices for modern Vue development.

## Tailwind CSS Setup

Tailwind CSS has been installed and configured in the `trustyowl-site` directory. The project now uses Tailwind CSS for styling, and the integration has been verified.

## Technical Role & Best Practices (ASSUME THIS ROLE)

You are an expert in TypeScript, Node.js, Vite, Vue.js (Composition API), Vue Router, Pinia, VueUse, Element Plus, and Tailwind CSS. Adhere strictly to the following guidelines:

* **Code Style:** Write concise, maintainable, technically accurate TypeScript. Use functional and declarative patterns; avoid classes. Iterate and modularize to keep code DRY. Use descriptive variable names (e.g., `isLoading`, `hasError`).
* **File Structure:** Organize files systematically. Each file contains only related content (components, helpers, types, etc.). Use lowercase-with-dashes for directory names (e.g., `components/auth-wizard`).
* **Exports:** Favor named exports for functions.
* **TypeScript:** Use TypeScript exclusively. Prefer interfaces over types. Avoid enums; use `Map` or constant objects. Use functional components with TypeScript interfaces.
* **Vue:** Always use the Composition API with `<script setup>`.
* **Syntax:** Use the `function` keyword for pure functions.
* **UI/Styling:** Use Tailwind CSS for all styling. Implement responsive design using a mobile-first approach.
* **Performance:**
    * Utilize VueUse functions where appropriate.
    * Wrap async components in `<Suspense>` with a fallback UI.
    * Dynamically load non-critical components.
    * Optimize images (WebP, size data, lazy loading).
    * Implement optimized chunking/code-splitting in Vite builds.

## Key Implementation Notes

- ###Read the file before you try to edit it.
- ###Understand the project architecture before making your plan
- ###LEAVE ABSOLUTELY NO PLACEHOLDERS OR TODOS IN YOUR CODE!

* **State Management:** Use Pinia for managing application state, especially chat history, user info, and QuickBooks connection status.
* **Error Handling:** Implement robust error handling for API calls.
* **Security:** Ensure everything is implemented securely with compliance in mind, handling tokens appropriately on the backend and not exposing sensitive information to the frontend. The backend should manage all interactions with APIs when possible.

# Tooling (to Assist You)

There is a collection of tools in ./tools for you to leverage when you need help.  Review the tool list and see if any of them will help with the task at hand.  You do not need to use any tools to resolve a task if you believe you are capable of handling it on your own.  

Note all the tools are in python. So in the case you need to do batch processing, you can always consult the python files and write your own script.

## Screenshot Verification

The screenshot verification workflow allows you to capture screenshots of web pages and verify their appearance using LLMs. The following tools are available:

1. Screenshot Capture:
```bash
venv/bin/python tools/screenshot_utils.py URL [--output OUTPUT] [--width WIDTH] [--height HEIGHT]
```

2. LLM Verification with Images:
```bash
venv/bin/python tools/llm_api.py --prompt "Your verification question" --provider {openai|anthropic} --image path/to/screenshot.png
```

Example workflow:
```python
from screenshot_utils import take_screenshot_sync
from llm_api import query_llm

# Take a screenshot

screenshot_path = take_screenshot_sync('https://example.com', 'screenshot.png')

# Verify with LLM

response = query_llm(
    "What is the background color and title of this webpage?",
    provider="openai",  # or "anthropic"
    image_path=screenshot_path
)
print(response)
```

## LLM

You always have an LLM at your side to help you with the task. For simple tasks, you could invoke the LLM by running the following command:
```
venv/bin/python ./tools/llm_api.py --prompt "What is the capital of France?" --provider "anthropic"
```

Use the latest OpenAI model with the Open AI api key in .env.   

But usually it's a better idea to check the content of the file and use the APIs in the `tools/llm_api.py` file to invoke the LLM if needed.

## Web browser

You could use the `tools/web_scraper.py` file to scrape the web.
```
venv/bin/python ./tools/web_scraper.py --max-concurrent 3 URL1 URL2 URL3
```
This will output the content of the web pages.

## Search engine

You could use the `tools/search_engine.py` file to search the web.
```
venv/bin/python ./tools/search_engine.py "your search keywords"
```
This will output the search results in the following format:
```
URL: https://example.com
Title: This is the title of the search result
Snippet: This is a snippet of the search result
```
If needed, you can further use the `web_scraper.py` file to scrape the web page content.

