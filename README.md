# hyperbeam

Hyperbeam is a Python library designed to provide intelligent search tooling. 

## Features

- Search via DuckDuckGo for text, news, videos, and images.
- Optional integration with ScraperAPI for proxied requests.
- Standardized output schema for search results across different modes.
- Site-specific search limiting.

## Installation

You can install `hyperbeam` directly from PyPI using pip (or any pip-compatible package manager like uv):

```bash
pip install hyperbeam
```

Or using uv:

```bash
uv pip install hyperbeam
```

**Prerequisites for Usage:**

- Python 3.10+
- If you plan to use the ScraperAPI integration: a ScraperAPI API key set as the environment variable `SCRAPERAPI_API_KEY`.

## Usage

Once installed, you can import and use the `web_search` function from the `hyperbeam` package:

```python
from hyperbeam import web_search, ddgs_scraperapi_patch

# To use standard DuckDuckGo search (no ScraperAPI):
# Perform a text search
text_results = web_search(keywords="latest advancements in AI", mode="text")
for result in text_results[:2]: # Print first two results
    print(result)

# Perform a news search for the last week
news_results = web_search(keywords="python programming news", mode="news", timeframe="w")
for result in news_results[:2]:
    print(result)

# To use ScraperAPI for proxied requests:
# 1. Ensure the SCRAPERAPI_API_KEY environment variable is set.
# 2. Call the patch function *once* in your application startup.
try:
    ddgs_scraperapi_patch()
    print("ScraperAPI patch applied successfully.")
except ValueError as e:
    print(f"ScraperAPI patch could not be applied: {e}")
    print("Proceeding without ScraperAPI.")

# Example call after attempting to patch (will use ScraperAPI if patch was successful and key was set):
video_results_via_scraper = web_search(keywords="uv python tutorial", mode="video", timeframe = "y")
if video_results_via_scraper:
    print("\nVideo results (potentially via ScraperAPI if patched):")
    for result in video_results_via_scraper[:5]:
        print(result)
```

For more detailed examples, including how to set up and use the ScraperAPI patch effectively, refer to the example notebooks or documentation within the repository (once available).

## Development Setup

If you want to contribute to `hyperbeam` or install it for development purposes:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/hyprbm/hyperbeam.git
    cd hyperbeam
    ```

2.  **Recommended: Set up a virtual environment using `uv` (or your preferred tool):**
    ```bash
    uv venv # Create a virtual environment (e.g., .venv)
    source .venv/bin/activate # Activate (Linux/macOS)
    # For Windows (PowerShell): .venv\Scripts\Activate.ps1
    # For Windows (CMD): .venv\Scripts\activate.bat
    ```

3.  **Install in editable mode with development dependencies:**
    This project uses `pyproject.toml` for packaging.
    ```bash
    uv pip install -e .[development]
    ```
    The `[development]` extra includes tools like linters and formatters (e.g., black, flake8, isort).

4.  **Set up Environment Variables for Development (Optional):**
    If you'll be testing the ScraperAPI integration during development, create a `.env` file in the project root:
    ```env
    SCRAPERAPI_API_KEY="your_actual_api_key_here"
    ```
    The library itself (when used as a package) relies on the environment variable being set directly in the execution environment, but for development, a `.env` file can be convenient if you use a tool that loads it (like `python-dotenv` specified in `dev` dependencies, often used in test runners or scripts).

## Contributing

(Optional: Add details about running tests, linters, or specific contribution guidelines here if applicable.)
