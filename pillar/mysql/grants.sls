#!jinja|yaml|gpg
users:
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

  - name: 'root'
    host: '%'
    enable: True
    pass: |
      -----BEGIN PGP MESSAGE-----

      hQGLA0grNKYaOe2IAQv2JCLsGV76cBAGiWOxzMhNwZHVNb8yl1pP5odbDh+ZgrvA
      YQ9DHvzG5SQFK62gKRbGe5GpOKeyyFWADp4d/2MZWWbxQkJvsZsICDXhCXGp42W5
      DzkS1bCd9XzN9Jy6Zn9X71dMGGkVSRWeUiEls8k/p77beHnGu1PDJFqiqSrLztKf
      L+1IiV/B8yFyQsR56x2NlzfniSaDKhGUAyEpZj3OibKX0In/WCRFE+X2u3UGzMn6
      PG2c34NucONHXEy1q9A0mpHyKwpSC9H+cEU5xQQN6enLFtKiSuuhz7btecHFyV+7
      SSoHsHXcaZM1ttqSAw9/g7hfIpHTx9Ae2yLMOl37qw7n0q/QrplgiePvXTR0Lqlj
      3noFTNFLkpCBq9iwYgUpR7cYL/aUxOLrHAlUEVA9NYTK1sZkmzdeOLvx95GU4/yf
      s9NVqMby+aPxh5xGtaUL/aoy+rqq2f95asjmH0sje1AKnFSjhTfEERf3KWWmhd5c
      klVQ7KaqV0i6B/Wh3ELSQgE1k+TKILi82RyqJ0qkEKrKwe//oX1anDolkCa6XeUj
      dCZGBUpt5+S682YhHnADxS7dg1FQmIMOFpvjGoHB6ojqHg==
      =HbRe
      -----END PGP MESSAGE-----
    role: normal

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

roles:
  - users:
      - {"name": "replication", "host": "%", "enable": False }
    grants:
      - database: '*.*'
        name: replication_slave_grants
        grant: 'replication slave'
        enable: True
        grant_option: False

  - users:
      - {"name": "root", "host": "%", "enable": True }
      - {"name": "majid", "host": "%", "enable": True }
    grants:
      - database: '*.*'
        name: access_full_grants
        grant: all privileges
        enable: True
        grant_option: True