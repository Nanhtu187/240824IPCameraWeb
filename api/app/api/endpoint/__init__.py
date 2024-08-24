from fastapi import APIRouter

from api.app.api.endpoint.health import router

api_router = APIRouter()

api_router.include_router(router, prefix="/health")