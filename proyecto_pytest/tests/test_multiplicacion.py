import pytest

def mult(a, b):
    **Funcion que mult
    return a*b

def test_mult():
    assert mult(1,2)=2
    assert mult(1,-1)=-1
    assert mult(0,0)=0

def mult_fail():
    assert mult(7,8)=3