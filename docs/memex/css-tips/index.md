
---
title: CSS Tips
---

# CSS Tips

Those are some tips from an [Udemy course I bought](https://www.udemy.com/course/css-the-complete-guide-incl-flexbox-grid-sass/) to better understand CSS.

The first lessons were about basic rules that I already know, I'm adding here some
of the advanced tips or useful stuff to keep organized so I can later
come back and remember when I need to.

## General

* Prefer kebab-case to name id and class selectors

* Multiple rules can be applied to the same element, the conflicts are resolved following this rule (most important to less important): 
  
  inline styles > #id selectors > .class, :pseudo-class and \[attribute\] selectors > \<tag\> and ::pseudo-element selectors

## Combinators

* **Adjacent Sibling** `h2 + p { }`:
  - Elements share the same parent
  - Second element comes **immediately** after first element

```
Adjacent Sibling:
<div>
     <h2>Not applied</h2>
     <p>-- Applied --</p>
     <h3>Not Applied</h3>
     <p>Not applied</p>
     <h2>Not applied</h2>
     <p>--Applied --</p>
</div>
```

* **General Sibling** `h2 ~ p { }`
  - Elements share the same parent
  - Second element comes after first element

```
General Siblings:
<div>
     <h2>Not applied</h2>
     <p>-- Applied --</p>
     <h2>Not applied</h2>
     <h3>Not applied</h3>
     <p>-- Applied --</p>
</div>
```

* **Child** `div > p { }`
  - Second element is a direct child of first element

```
Child:
<div>
    <div>Not applied</div>
    <p>-- Applied --</p>
    <div>Not applied</div>
    <article>
        <p>Not applied</p>
    </article>
    <p>-- Applied --</p>
</div>
```

* **Descendant** `div p { }`
  - Second element is a descendant of the first element

```
Descendant:
<div>
    <div>Not applied</div>
    <p>-- Applied --</p>
    <div>Not applied</div>
    <article>
        <p>-- Applied --</p>
    </article>
    <p>-- Applied --</p>
</div>
```

## Box Model

* **Margin Collapsing**  
  Two adjacent elements sharing one margin event tough each element has its own one
  
  * **Adjacent Siblings**
    
    The first element might have a margin of 10px on all sides and the second one has 5px. CSS will collapse the margins and only add the bigger one between the elements. So if I got margins of 10px and 5px, a 10px margin will be added between the elements.
  
  * **A parent with children that have a margin**
    
    The first or last or the only child has to have margins. In that case, the parent elements margin will collapse with the child element margins. The bigger margin wins and will be applied to the parent element.
  
  * **An empty element with margins**
    
    If I got an element with no content, no padding, no border and no height, then the top and botton margin will be merged into one single margin. The bigger one wins.

## Box Sizing

* `box-sizing: content-box;`
  
  * default, the width and height properties include the content, but does not include the padding, border, or margin.

* `box-sizing: border-box;`
  
  * the width and height properties include the content, padding, and border, but does not include the margin.

## Display Property

* `display: block`
  
  * Every elements is on its own row, some elements having this property by standard are: \<div\>, \<p\>, \<section\>, \<article\>, \<nav\>, \<h1\>,  <\h2\> etc..

* `display: inline`
  
  * Every element is on the same row, it is not possible to set top and bottom margins. top and bottom paddings will also have a different effect: they don't push the adjacent content awaybut they will do so on the element border. Additionally, setting an height and width has no effect to take as musch space as required by the content. Some examples are: \<a\>, \<span\>, \<img\>

* `display: inline-block`
  
  * Every element is on the same row but is possible to set margin and paddings

* `display: none`
  
  * The element is not visible but it's still present in the DOM. This will mean that it doesn't block its position, Other elements will take its place. If I need to hide an element AND block its position so other elements wouldn't take its place I can use `visibility: hidden;` instead.

## Pseudo Classes & Pseudo Elements

* **Pseudo Class:**
  
  * Defines the style of a **special state** of an element
    
    Examples: `:hover`, `:active`

* **Pseudo Element:**
  
  * Defines the style of a **specific part** of an element
    
    Examples: `::first-letter`, `::after`, `::before`

## Links

* [CSS Reference from MDN](http://www.devdoc.net/web/developer.mozilla.org/en-US/docs/DOM/CSS.html)
* [Common CSS Properties Reference](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_Properties_Reference)
