from fastapi import APIRouter

from api.app.helper.base_response import ResponseSchemaBase

router = APIRouter()


@router.get("")
async def health():
    return ResponseSchemaBase().success_response()