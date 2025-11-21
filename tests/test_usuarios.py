import psycopg2
import pytest

@pytest.fixture
def db():
    conn = psycopg2.connect(
        host="localhost",
        database="test_db",
        user="postgres",
        password="postgres"
    )
    cur = conn.cursor()
    yield cur
    conn.commit()
    cur.close()
    conn.close()


def test_usuarios_existen(db):
    db.execute("SELECT COUNT(*) FROM usuarios;")
    assert db.fetchone()[0] >= 2


def test_productos_jsonb(db):
    db.execute("SELECT COUNT(*) FROM productos;")
    assert db.fetchone()[0] >= 5


def test_productos_hstore(db):
    db.execute("SELECT COUNT(*) FROM product;")
    assert db.fetchone()[0] >= 5
