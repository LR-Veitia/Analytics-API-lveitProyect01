from fastapi import APIRouter

router = APIRouter()


@router.get("/events")
def read_events():
    """Retrieve a list of event items."""
    return {
        "items": [1, 2, 3]
    }
