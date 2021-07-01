{
  "name": "{{module_name}}",
  "version": "1.0.0",
  "description": "{{prefix}}Service",
  "main": "{{output}}",
  "scripts": {
    "test": "mocha"{% if (isDotNet) %},
    "postinstall": "cd dotnet && dotnet build"{% endif %}
  },
  "repository": {
    "type": "git",
    "url" : "{{git}}"
  },
  "keywords": [
    "ecosystem:allex",
    "Service",
    "{{prefix}}"
  ],
  "author": "{{author|raw}}",
  "license": "ISC"
}

