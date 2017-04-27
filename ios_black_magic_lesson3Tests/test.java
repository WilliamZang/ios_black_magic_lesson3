class JavaClassA {
    public int a(int a) {
        return a * a;
    }
}

class JavaClassB extends JavaClassA {

}

class JavaClassC extends JavaClassB {
    @override
    public int a(int a) {
        return super.a(a);
    }
}
