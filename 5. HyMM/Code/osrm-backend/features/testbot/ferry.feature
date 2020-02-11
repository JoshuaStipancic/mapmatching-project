@routing @testbot @ferry
Feature: Testbot - Handle ferry routes

    Background:
        Given the profile "testbot"

    Scenario: Testbot - Ferry duration, single node
        Given the node map
            """
            a b c d
            e f g h
            i j k l
            m n o p
            q r s t
            u v w x
            """

        And the ways
            | nodes | highway | route | duration |
            | ab    | primary |       |          |
            | cd    | primary |       |          |
            | ef    | primary |       |          |
            | gh    | primary |       |          |
            | ij    | primary |       |          |
            | kl    | primary |       |          |
            | mn    | primary |       |          |
            | op    | primary |       |          |
            | qr    | primary |       |          |
            | st    | primary |       |          |
            | uv    | primary |       |          |
            | wx    | primary |       |          |
            | bc    |         | ferry | 0:01     |
            | fg    |         | ferry | 0:10     |
            | jk    |         | ferry | 1:00     |
            | no    |         | ferry | 24:00    |
            | rs    |         | ferry | 96:00    |
            | vw    |         | ferry | P5D      |

        When I route I should get
            | from | to | route | time        |
            | b    | c  | bc,bc | 60s +-1     |
            | f    | g  | fg,fg | 600s +-1    |
            | j    | k  | jk,jk | 3600s +-1   |
            | n    | o  | no,no | 86400s +-1  |
            | r    | s  | rs,rs | 345600s +-1 |
            | v    | w  | vw,vw | 419430s +-1|

    @todo
    Scenario: Testbot - Week long ferry routes
        Given the node map
            """
            a b c d
            e f g h
            i j k l
            """

        And the ways
            | nodes | highway | route | duration |
            | ab    | primary |       |          |
            | cd    | primary |       |          |
            | ef    | primary |       |          |
            | gh    | primary |       |          |
            | ij    | primary |       |          |
            | kl    | primary |       |          |
            | bc    |         | ferry | 24:00    |
            | fg    |         | ferry | 168:00   |
            | jk    |         | ferry | 720:00   |

        When I route I should get
            | from | to | route | time        |
            | b    | c  | bc,bc | 86400s +-1  |
            | f    | g  | fg,fg | 604800s +-1 |
            | j    | k  | jk,jk | 259200s +-1 |

    Scenario: Testbot - Ferry duration, multiple nodes
        Given the node map
            """
            x         y
              a b c d
            """

        And the ways
            | nodes | highway | route | duration |
            | xa    | primary |       |          |
            | yd    | primary |       |          |
            | ad    |         | ferry | 1:00     |

        When I route I should get
            | from | to | route | time      |
            | a    | d  | ad,ad | 3600s +-1 |
            | d    | a  | ad,ad | 3600s +-1 |

    @todo
    Scenario: Testbot - Ferry duration, individual parts, fast
    Given a grid size of 10000 meters
        Given the node map
            """
            x y   z     v
            a b   c     d
            """

        And the ways
            | nodes | highway | route | duration |
            | xa    | primary |       |          |
            | yb    | primary |       |          |
            | zc    | primary |       |          |
            | vd    | primary |       |          |
            | abcd  |         | ferry | 0:06     |

        When I route I should get
            | from | to | route     | time     |
            | a    | d  | abcd,abcd | 360s +-1 |
            | a    | b  | abcd,abcd | 60s +-1  |
            | b    | c  | abcd,abcd | 120s +-1 |
            | c    | d  | abcd,abcd | 180s +-1 |

    @todo
    Scenario: Testbot - Ferry duration, individual parts, slow
        Given the node map
            """
            x y   z     v
            a b   c     d
            """

        And the ways
            | nodes | highway | route | duration |
            | xa    | primary |       |          |
            | yb    | primary |       |          |
            | zc    | primary |       |          |
            | vd    | primary |       |          |
            | abcd  |         | ferry | 1:00     |

        When I route I should get
            | from | to | route     | time      |
            | a    | d  | abcd,abcd | 3600s ~1% |
            | a    | b  | abcd,abcd | 600s ~1%  |
            | b    | c  | abcd,abcd | 1200s ~1% |
            | c    | d  | abcd,abcd | 1800s ~1% |

    Scenario: Testbot - Ferry duration, connected routes
        Given the node map
            """
            x       d       y
              a b c   e f g t
            """

        And the ways
            | nodes | highway | route | duration |
            | xa    | primary |       |          |
            | yg    | primary |       |          |
            | abcd  |         | ferry | 0:30     |
            | defg  |         | ferry | 0:30     |

        When I route I should get
            | from | to | route          | time      |
            | a    | g  | abcd,defg,defg | 3600s +-1 |
            | g    | a  | defg,abcd,abcd | 3600s +-1 |

    Scenario: Testbot - Prefer road when faster than ferry
        Given the node map
            """
            x a b c
                    d
            y g f e
            """

        And the ways
            | nodes | highway | route | duration |
            | xa    | primary |       |          |
            | yg    | primary |       |          |
            | xy    | primary |       |          |
            | abcd  |         | ferry | 0:02     |
            | defg  |         | ferry | 0:02     |

        When I route I should get
            | from | to | route    | time      |
            | a    | g  | xa,xy,yg | 60s +-25% |
            | g    | a  | yg,xy,xa | 60s +-25% |

    Scenario: Testbot - Long winding ferry route
        Given the node map
            """
            x   b   d   f   y
              a   c   e   g
            """

        And the ways
            | nodes   | highway | route | duration |
            | xa      | primary |       |          |
            | yg      | primary |       |          |
            | abcdefg |         | ferry | 6:30     |

        When I route I should get
            | from | to | route           | time       |
            | a    | g  | abcdefg,abcdefg | 23400s +-3 |
            | g    | a  | abcdefg,abcdefg | 23400s +-3 |

    @todo
    Scenario: Testbot - Ferry duration formats
        Given the node map
            """
            a c e g i k m o q s
            b d f h j l n p r t
            """

        And the ways
            | nodes | route | duration |
            | ab    | ferry | 0:01     |
            | cd    | ferry | 00:01    |
            | ef    | ferry | 1:00     |
            | gh    | ferry | 01:00    |
            | ij    | ferry | 02:20    |
            | kl    | ferry | 10:00    |
            | mn    | ferry | 100:00   |
            | op    | ferry | 1000:00  |
            | qr    | ferry | 10000:00 |

        When I route I should get
            | from | to | route | time          |
            | a    | b  | ab,ab | 60s +-1       |
            | c    | d  | cd,cd | 60s +-1       |
            | e    | f  | ef,ef | 3600s +-1     |
            | g    | h  | gh,gh | 3600s +-1     |
            | i    | j  | ij,ij | 8400s +-1     |
            | k    | l  | kl,kl | 36000s +-1    |
            | m    | n  | mn,mn | 360000s +-1   |
            | o    | p  | mn,mn | 3600000s +-1  |
            | q    | r  | mn,mn | 36000000s +-1 |
