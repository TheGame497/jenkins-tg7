import pytest

def suma(a, b):
    **Funcion que suma
    return a+b

def test_suma():
    assert suma(1,2)=3
    assert suma(1,-1)=3
    assert suma(0,0)=0

def suma_fail():
    assert suma(7,8)=3