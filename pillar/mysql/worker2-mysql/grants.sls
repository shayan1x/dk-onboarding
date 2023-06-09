#!jinja|yaml|gpg

mysql_auth:
  root_password: |
    -----BEGIN PGP MESSAGE-----
    hQGMA0grNKYaOe2IAQv/dUJ7/2zD6Q7fHaK/a3z8GP5Z3762CZlaNW2Uv6qnpvaz
    hJbfAD8DkZABZRyAgU89/ysRaxVVKfl7gB4LZLWhTdXy4lGRFPCzh62MdSsP7ybr
    JwTFbHDgl03at5XkJNyHk8ALjcwD++rVJcozDYA7dbjPoGqshAYDRoCDkrzXqZS0
    He6M/UEBRUpTJ1HfP+6FMxw2gztq0R98Ft3ULduEQzJe4SpErPZxwmY+/0y9vMC0
    f5K0Cdc82Eru3ndaJBnbtmuL+BMB3hJAaYi+yUN3gbrckJE/DPy7CCV5sdVDjmAg
    mQC0rlrL58lvA0u/IB4BzwvwhBZK6bnCz2HEzppPecR5bPF4+GRUKvCmT40slwVg
    1Oxsrh5+PwDg/vJtf9xa6wcaPnUziTD7PAIKqyxWyc1UQmc/QPqokrBhYzyb8J9D
    Y784v+xtjJLpHzzI3gLWvzfr48fdxMDQ1SmCAY0NbmqvUWgSySzG2zlSg4mMK3Oz
    ynoePGMdMSrDDTgl8uPF0kEB7kkY1tB7zumwMyo2iIMLq+cF6imgmIhYpaUrdpdC
    Q91AseyvoxiA2Ozzl9Gnwe+eVq+CSYT6k9ro65S2UFlBtQ==
    =qIqv
    -----END PGP MESSAGE-----
  root_auth_plugin: mysql_native_password


mysql_users:
  - name: 'replication'
    host: '%'
    enable: True
    pass: |
      -----BEGIN PGP MESSAGE-----

      hQGMA0grNKYaOe2IAQv+LuBFggoaZZYrwT6zhFJynGwkA0mJlakqLpnFgVF58cvq
      uARJSFxi6pjG3LoWw951VXOEpq9DA35za3F7id3wX8vUi3iKDGxJTfCYHb12/1tf
      wL4kfike2oTIvf9iQKdsdCxM4nH5ypSXYASYwACIGO54dojNPmkEmlY8qEMuUCBU
      X7mzqwmE7dfphqdd9hFbDcOqw7WthN7+3y1AVxYiONgWt03XhwXda42+E5yvW30D
      BYP4CBCUlARwQBHDQMtFi5TS5rMh1gxbsnj94hHTvEn+Giud5p9OFssNcuGecCCo
      0cSUthTeeuDHr34vrDh3vPAePzo+oHzHfNem/JDD6o5boVkNWgWaNOKReW38gATL
      5YDi4FRg/Vjgb/o8DSX7qqUYmYcD/N9EH05yPAseEBy6q+VlgM/yGbln6Bm+eV9c
      Ooj3ma/PGM2SJKpmYfKti94leUItrE74ch/O/4Dzbkj6PivYKHyNRS4a/N61ipUb
      GP3z5lkK12ihkVfeYHia0kAB0KzBG8dnAEc+k2dY0fduReBuUwsxEJofs2HJx4vF
      PDMFTpV5bmFIZOyQFugaTGfQ4hwEV9lulP51MJ4wscgN
      =ydSL
      -----END PGP MESSAGE-----
    role: replication

  - name: 'shayan'
    host: '%'
    enable: True
    pass: |
      -----BEGIN PGP MESSAGE-----

      hQGMA0grNKYaOe2IAQv9HRSBSc0I7ixTYhsEIyW8/iyY2tVIhkGCUrKlIlCG0RsH
      W2KE8zilXtfwcmvP14cy/EiYBWs/Zw4tob6GtH+Bm0Hh50vQkc6RlP+6LK9tH4oH
      jo6lPtOvZDGP84HYg0ABYzx1Y9IZApzxq9d0VDketH6XYxbgLLCIfLRWwF+MFQkP
      +EQwrBjqYgbsQdHi8yco7Ts2pwlF2uHqPEBGjSx4UBg0PWMUkt6dwVx+VAIaOOQE
      yYNADDzRWw1p6t3sA0wWzmsNzme9SLVZiAmGSTV1R3uHMlCGFRulL5roVrJ1MI/F
      D9jPzYrImP//kxtTlqZ4saKinV5adnrEG3Bc07sCO/JfCez2frlXYRrv66hVFoCJ
      gRW21M2I3a4S4jnQAsYhb1pqV6pHEeB/c9E9v4ihr2bVZP4i6BtZ0rNFQWaai5mu
      23qwVDgSIXn+4FHw0f0w3hlkF4Qi7eOlupawExUKKkPcZxuUFmXpqSyrZxZ6nkr9
      QQzFcs1HhU3zK2k2cw/50ksBtZvb9m6wM7MnMzFDp4PpAAhwgVwn2kYdoTBRqlG8
      ks5XVbqPxqJanm1tB3BJvfqEOg4v3bgFLXVUmG4dDLj2z8/bItiaWtGZnNY=
      =J9B7
      -----END PGP MESSAGE-----
    role: normal

mysql_roles:
  - users:
      - {"name": "replication", "host": "%", "enable": True }
    grants:
      - database: '*.*'
        name: replication_slave_grants
        grant: 'replication slave'
        enable: True
        grant_option: False

  - users:
      - {"name": "shayan", "host": "%", "enable": True }
    grants:
      - database: '*.*'
        name: access_full_grants
        grant: SELECT,UPDATE,DELETE,INSERT
        enable: True
        grant_option: False