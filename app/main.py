from fastapi import FastAPI
from datetime import datetime, timezone

app = FastAPI()

@app.get("/time")
def get_time():
    # Get the current time in UTC using timezone
    current_time = datetime.now(timezone.utc).isoformat()
    return {"current_time": current_time}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="0.0.0.0", port=5000,
#    ssl_certfile="/etc/letsencrypt/live/jbadeyi.xyz/fullchain.pem",
#    ssl_keyfile="/etc/letsencrypt/live/jbadeyi.xyz/privkey.pem")
)
