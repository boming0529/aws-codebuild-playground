import sys

def lambda_handler(event, context):
    print("--------------------------------------------------")
    print("🚀 Hello from AWS CodeBuild (ARM64)!")
    print(f"🐍 Python Version: {sys.version}")
    print("✨ Built with 'uv' - The lightning fast package manager")
    print("--------------------------------------------------")

    return {
        "statusCode": 200,
        "body": "Hello from Lambda!"
    }
