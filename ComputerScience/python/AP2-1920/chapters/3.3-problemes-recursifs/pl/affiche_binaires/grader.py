def chaines_binaires_aux(n, prefixe):
    if n <= len(prefixe):
        return prefixe + '\n'
    else:
        return (chaines_binaires_aux(n, prefixe + '0')
                + chaines_binaires_aux(n, prefixe + '1'))

def chaines_binaires(n):
    if n == 0:
        return ''
    else: 
        return chaines_binaires_aux(n, '')

begin_test('Exécution sans erreur')
execute_source()
assert_output("")
assert_no_exception()

begin_test_group("Test de la fonction <tt>affiche_binaires_prefix</tt>")

begin_test('Respect des consignes')
assert_defines_function("affiche_binaires_prefixe")
assert_returns_none("affiche_binaires_prefixe")
assert_no_loop("affiche_binaires_prefixe")
assert_recursion("affiche_binaires_prefixe(3, '')")

begin_test('Chaînes binaires de longueur 3 et de préfixe "000"')
evaluate('affiche_binaires_prefixe(3, "000")')
assert_output('000\n')
assert_result(None)

begin_test('Chaînes binaires de longueur 3 et de préfixe "0"')
evaluate('affiche_binaires_prefixe(3, "0")')
assert_output(chaines_binaires_aux(3, "0"))
assert_result(None)

begin_test_group("Test de la fonction <tt>affiche_binaires</tt>")

begin_test('Respect des consignes')
assert_defines_function("affiche_binaires")
assert_returns_none("affiche_binaires")
assert_no_loop("affiche_binaires")
assert_calls_function("affiche_binaires", "affiche_binaires_prefixe")

begin_test('Chaînes binaires de longueur 0')
evaluate('affiche_binaires(0)')
assert_output('')
assert_result(None)

begin_test('Chaînes binaires de longueur 3')
evaluate('affiche_binaires(3)')
assert_output(chaines_binaires(3))
assert_result(None)

