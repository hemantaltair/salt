hemant-secret:
  password: |
    {{ salt['gpg.decrypt'](gnupghome='/etc/salt/gpgkeys', bare=True, text='''
-----BEGIN PGP MESSAGE-----

hQGMA3XpCO+2zD6qAQwAoWf7N8ihcMei8wFF3MqbGHlSDrcjOI0xMQeTh+QzfXta
dpMf5UemIArZLedq9afvZr78261TZx5M4RSgZnhjBQLFK6KpFx0yRkfFrC5ER7ZT
82hYxG2c1gQG6EqQP66grg8HMoLGUSloWxzsT4Fkx/p0FWdxYIvhp3IQt8bsLZ5S
0iQhLOoH+651KFywFLce+RvqTRwhr8AZhriXlo5DwfDeNDkQYYmhtbApsFwjHf2j
qdrMrKpAvXS+H3kNlW67/1GiESW7lBVyfo7lIQAVsCno2naIrWu2wBCYNhnkSMqI
xdGLtBHPHiGpvMGtSCSufzQXB7yQGhcGF5/HV7PRj8gMzo7Ou5nLnFW/vpeOMIkB
fXU/NX5hn0OBfTNvnn9iu3Y/bDZjYU0U0gVccsnQmngqpr+OhZCci3IrpUlbJrBy
jlwEeaMqUPuta76rTcaQPrCPY9l46iZ/GjAS3e5SHcg8swsoFW71kCi4UIx9vJ90
RFvskJU3PDUH2lMNax0S0kcB/70tVXobevXgNGLUZWNeex8VrxhTqmCElqrKuS7e
9GYpyuTUrawGxmQcms5b9vg61m/lupOfFJvYWr4kjtFA/4jxIDUk/w==
=ALNV
-----END PGP MESSAGE-----''') | indent(4) }}
