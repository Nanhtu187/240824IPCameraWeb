from fastapi import FastAPI

from api.app.api.endpoint import api_router


def create_app() -> FastAPI:
    app = FastAPI()
    app.include_router(prefix="/api", router=api_router)

    return app