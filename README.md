<!-- markdownlint-disable MD001 MD033 -->
# OMPLibrary

## Introduction

This library contains a set of extensions and classes that I have come to depend on for a majority of my projects. I have either written or gathered the code from various sources throughout my career. This entire library was originally written in Xcode with Objective-C. But now with Swift being open-sourced and supporting Linux as well as MacOS I decided to make a *"Pure Swift"* variant.

This library is organized into 2 concerns:

1. Extensions
2. Utilities

## Extensions

Extensions are very powerful tools in both Swift and Objective-C *(where they are called "Categories")*. They allow a developer to retroactively add new methods and computed properties to pre-defined classes and structs. As Swift in Linux only has a subset of classes defined in MacOS this Library will focus on those classes and only modify them with functions that it can implement...

Example: Since the UI components of MacOS and iOS are not available to Linux, this library will not be able to add functions that calculate the rectangle size that can contain a given string using a given font.

## Utilities

This part of the library will contain defined classes that are useful for certain development concerns.

Example: The *"Parser"* class contains functions that simplify the parsing of JSON files or data into a generic `Dictionary<Sring,Any>`.
