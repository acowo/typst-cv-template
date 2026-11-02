
#set page(
  paper: "a4",
  margin: (x: 15mm, y: 12mm),

    footer: context [
    #align(center)[
      #text(size: 6.7pt)[
        Built with #link("https://typst.app")[Typst]
      ]
    ]
  ],
)

#set text(
  font: "Fira Sans",
  size: 8.5pt,
  fill: rgb("#252A32"),
)

#set par(leading: 0.45em, justify: false)

#set list(
  indent: 10pt,
  body-indent: 3pt,
  spacing: 0.15em,
)

#let accent = rgb("#383481")
#let muted = rgb("#6f667e")

// ── Configuration ──────────────────────────

#let include-photo = false
#let photo-path = "../assets/headshot.jpg"

// ── Components ─────────────────────────────

#let section(title) = {
  v(0.65em)
  text(size: 9.5pt, weight: "bold", fill: accent)[#upper(title)]
  v(0.2em)
  line(length: 100%, stroke: 0.6pt + accent)
  v(0.35em)
}

#let entry(title, detail, body, url: none) = {
  if url == none {
    text(weight: "bold", size: 8.8pt)[#title]
  } else {
    text(weight: "bold", size: 8.8pt)[
      #link(url)[#title]
    ]
  }

  linebreak()
  text(size: 7.6pt, fill: muted)[#detail]
  v(0.12em)
  body
  v(0.4em)
}

#let skill(label, content) = {
  text(weight: "bold", size: 8.2pt)[#label]
  linebreak()
  text(size: 8.2pt)[#content]
  v(0.35em)
}

// ── Header ─────────────────────────────────

#let identity = [
  #text(size: 24pt, weight: "bold", tracking: -0.7pt)[Firstname Lastname]

  #v(0.2em)

  #text(size: 8pt, fill: muted)[
    Someplace, World
    #h(0.4em) · #h(0.4em)
    #link("mailto:your.email@example.com")[your.email@\example.com]
    #h(0.4em) · #h(0.4em)
    +12 34 56 78 90
  ]

  #text(size: 8pt, fill: muted)[
    #box(
      baseline: 0.2em,
    )[
      #image("../assets/GitHub_Invertocat_Black.svg", height: 8pt)
    ]
    #h(3pt)
    #link("https://github.com/your-profile")[github.com/your-profile]
    #box(
      baseline: 0.2em,
    )[
      #image("../assets/LinkedIn_icon.svg", height: 8pt)
    ]
    #h(3pt)
    #link("https://www.linkedin.com/in/your-profile")[linkedin.com/in/your-profile/]
  ]
]

#if include-photo {
  grid(
    columns: (1fr, 27mm),
    column-gutter: 12pt,
    align: (left, right),
    identity,
    image(
      photo-path,
      width: 27mm,
      height: 33mm,
      fit: "cover",
    ),
  )
} else {
  identity
}

#v(0.6em)
#line(length: 100%, stroke: 0.8pt + accent)
#v(0.2em)

// ── Main two-column layout ──────────────────

#grid(
  columns: (0.34fr, 0.66fr),
  column-gutter: 13pt,
  align: top,

  // ── Sidebar ───────────────────────────────

  [
    #section("Profile")

 Nulla dapibus risus id orci viverra, eu dapibus leo suscipit. Nam eleifend nunc quis quam semper, non efficitur arcu cursus. 

    #section("Education")

    #text(weight: "bold", size: 8.5pt)[Institution]
    #linebreak()
    #text(size: 7.6pt, fill: muted)[Duration]
    #v(0.1em)
    Degree
    #linebreak()
    Program

    #section("Technical Skills")

    #skill("Type of skill (e.g., programming)", [Skill 1, skill 2, skill 3])

    #skill("Praesent", [Duis, accumsan, mi, ac, viverra, mattis])

    #skill("Feugiat", [Nam, mauris, nunc, efficitur, et, maximus])

    #skill("Tellus", [Fusce, imperdiet, risus])

    #section("Languages")

    #text(weight: "bold")[Language] (level)
    #linebreak()
    #text(weight: "bold")[Language] (level)
    #linebreak()
    #text(weight: "bold")[Language] (level)

    #section("References")
    #text("Available upon request")
  ],

  // ── Main column ───────────────────────────

  [
    #section("Selected Projects")

    #entry(
      "Title",
      "Skills learned/used",
      [
         Project description. Sed vestibulum, urna et semper sodales, massa nunc pharetra lectus, vitae auctor augue sem non nulla. Quisque convallis elementum arcu, ac condimentum quam feugiat id.
      ],
      url: "link-to-project",
    )



    #entry(
      "Pellentesque ligula quam",
      "Porta consectetur mi",
      [
        Cras placerat ligula sem, vitae interdum metus sodales sed. Quisque ut eleifend elit, ut consectetur arcu. Cras accumsan turpis vel nibh iaculis volutpat. Aliquam erat volutpat. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. 
      ],
    )

    #section("Experience")

    #entry(
      "Job title",
      "Company | Duration",
      [
        Job description.
         Duis accumsan mi ac viverra mattis. Donec eu diam dui. Nam mauris nunc, efficitur et maximus et, molestie sit amet orci. Suspendisse orci tellus, rhoncus vel magna non, condimentum faucibus justo.  
      ],
    )

    #entry(
      "Etiam commodo",
      "Odio finibus efficitur vestibulum | efficitur",
      [
        Etiam commodo odio finibus efficitur vestibulum. Etiam sem sem, efficitur ac congue a, ultrices vel erat. Aenean eget erat cursus, vulputate lorem nec, vestibulum dui.
      ],
    )
  ],
)
