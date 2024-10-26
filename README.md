# HTML Cant
HTML Cant is a simplfied syntax for HTML and templating in Gleam. You can see a quick example of the syntax here:
```css
div {
  h1 "This is a title"
  p [.add-a-css-class .add-another] "This text is styled"
  div [#welcome .section] {
    a [href="/"] "HOME"
  }
}
```

## Syntax Guide
This is a brief outline of HTML Cant's syntax, for more detail check out the grammar in `src/cant.pest`.

### Element Syntax
Elements in Cant are constructed as follows:
`tag-name [attribute list] {child element(s)}`
- **Tag Name** is any valid HTML tag - like div, h1, p, or head - written plainly, on it's own (i.e. no surrounding characters).
- **Attribute List** is where any extra tag attributes go, with shorthand for classes (`.classname`) and IDs (`#element-id`). You can read more on these below.
- **Child Elements** is where you describe any children the block has. This can be either proper elements, or raw text strings.

### Comments & Whitespace
Comments in Cant are written as follows:
```
/* I'm an inline comment*/
// I'm a single line comment

/! I'm an inline comment that'll be inserted into the final html !/
//! I'm a single line comment that'll be inserted into the final html
```

Other simplified or abstracted markup languages often rely on whitespace to infer details about the structure of the desired DOM. Cant however is still verbose enough in it's syntax to remove the need for whitespace, allowing you to indent and format your code how you like.
```
html {
  head {
    title "Cantus Full Head Example"
    // Meta Info
    meta [charset="UTF-8"]
    meta [
      name="viewport"
      content="width=device-width, initial-scale=1.0"
    ]
    meta [
      name="description"
      content="An example of a fully-featured HTML head block using Cantus syntax"
      /* disabled="this attribute isn't active because it's in a comment" */
    ]
    
    // This comment won't be visible to the end user, but, the one below will be.
    //! Static CSS
    link [
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto"
      type="text/css"
    ]
 
    link [
      rel="stylesheet"
      href="styles.css"
      media="all"
    ]
 
    /! JS Libs !/
    script [
      src="some.js/library/from/cdn"
      integrity="..."
      crossorigin="anonymous"
    ]

    script [
      src="app.js"
      defer="true"
    ]
  }
}
```

### Extended Example
Below is a complete HTML page with many more examples of common HTML patterns in Cant.
```
html {
  head {
    title "Cantus Example"
    meta [charset="UTF-8"]
    link [rel="stylesheet" href="styles.css"]
  }
  body {
    header [#main-header] {
      h1 "Hello, Cantus!"
      p "This is a demonstration of Cantus syntax for clean HTML templating."
      nav {
        ul {
          li {a [href="#section1"] "Go to Section 1"}
          li {a [href="#section2"] "Go to Section 2"}
        }
      }
    }
    main {
      section [#section1 .content] {
        h2 "Section 1"
        p "This is the first section with a simple paragraph."
      }
      section [#section2 .content] {
        h2 "Section 2"
        p "Here’s another section showing text and structure."
        button [type="button"] "Click Me!"
      }
    }
    footer {
      p "© 2024 Cantus Project"
    }
  }
}```

## CLI Usage
The Cant Compiler (*cantus*) is a simple CLI tool written in the Rust programming language. This tool is used to generate static html files, transpile Gleam templates, and any other tasks you might need for development. Basic usage is as follows:
```sh
cantus
```

## Gleam Templating
### Variable Insertion
### Inline Code
### Alternate Output Formats
#### Lustre
