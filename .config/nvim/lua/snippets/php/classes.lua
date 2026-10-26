return {
  s(
    {
      filetype = "php",
      trig = "php",
      dscr = "testing one two",
    },
    fmta([[<<?php declare(strict_types=1); ?>>]], {})
  ),
  s(
    {
      filetype = "php",
      trig = "cls",
      dscr = "testing one two",
    },
    fmta([[class Foo\n{\n}]], {})
  ),
  s(
    {
      filetype = "php",
      trig = "pubf",
      dscr = "testing one two",
    },
    fmta(
      [[    public function <>(<>): <>
    {
        <>
    }
      ]],
      {
        i(1),
        i(2),
        i(3, "void"),
        i(0),
      }
    )
  ),

  s(
    {
      filetype = "php",
      trig = "_c",
      dscr = "testing one two",
    },
    fmta(
      [[    public function __construct(<>)
    {
        <>
    }
      ]],
      {
        i(1),
        i(0),
      }
    )
  ),

  s(
    {
      filetype = "php",
      trig = "/*",
      dscr = "testing one two",
    },
    fmta(
      [[    /**
     * <>
     */
      ]],
      {
        i(0),
      }
    )
  ),
}
