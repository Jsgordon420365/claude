# Claude

## Project Description

Claude is a unified environment for coding and development. The purpose of this project is to provide a streamlined and efficient setup for developers to work on various coding projects. The goals of the project include:

- Simplifying the setup process for new development environments
- Providing a consistent and reproducible environment for coding
- Integrating various tools and dependencies required for development
- Enhancing productivity and collaboration among developers

## Development Environment Setup

To set up the development environment for Claude, follow these steps:

1. **Clone the Repository**

   ```bash
   git clone https://github.com/Jsgordon420365/claude.git
   cd claude
   ```

2. **Set Up Python Virtual Environment**

   ```bash
   python3 -m venv venv
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

3. **Install Python Dependencies**

   ```bash
   pip install -r requirements.txt
   ```

4. **Install Node.js Dependencies**

   ```bash
   npm install
   ```

## Running the Project

To run the project, use the following commands:

1. **Activate the Virtual Environment**

   ```bash
   source venv/bin/activate  # On Windows use `venv\Scripts\activate`
   ```

2. **Start the Development Server**

   ```bash
   npm start
   ```

3. **Access the Application**

   Open your web browser and navigate to `http://localhost:3000` to access the application.

## Using the Key-Value Pair Database

This project includes a simple key-value pair database to associate URLs with descriptions. The database is implemented using an in-memory object and provides functions to add, retrieve, and delete URL-description pairs.

### Adding a URL and Description

To add a URL and its description, send a POST request to the `/add` endpoint with the following JSON body:

```json
{
  "url": "http://example.com",
  "description": "Example website"
}
```

### Retrieving a Description

To retrieve the description of a URL, send a GET request to the `/get` endpoint with the URL as a query parameter:

```http
GET /get?url=http://example.com
```

### Deleting a URL and Description

To delete a URL and its description, send a DELETE request to the `/delete` endpoint with the following JSON body:

```json
{
  "url": "http://example.com"
}
```

## Additional Information

This project also includes several scripts and configurations to help with the development process:

- `gca.bat`: A batch script to automate certain tasks on Windows.
- `mcp_setup_script.sh`: A cross-platform setup script for the MCP server.
- `.gitignore`: Configuration files to specify which files and directories should be ignored by Git.
- `dirs.txt`, `dirs1.txt`, `dirs2.txt`: Directory listings of the project structure.

For more details, refer to the respective files and their comments.
