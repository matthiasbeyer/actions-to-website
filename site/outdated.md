---
layout: single
title: cargo-outdated report
permalink: /outdated/
---

This page shows the `cargo-outdated` report for the last commit
on the `master` branch of the project (as of
<a href="https://github.com/matthiasbeyer/actions-to-website/commit/{{ site.data.outdated.gitrev }}">
    {{- site.data.outdated.shortrev -}}
</a>).

{% assign crate = site.data.outdated.data %}

## Crate {{ crate.crate_name }}

### Normal dependencies

<table>
    <tr>
        <th>Dependency</th>
        <th>Used</th>
        <th>Latest</th>
    </tr>
{% assign normals = crate.dependencies | where: "kind", "Normal" %}
{% for dependency in normals %}
    <tr>
        <td>{{ dependency.name }}</td>
        <td>{{ dependency.project }}</td>
        <td>{{ dependency.latest }}</td>
    </tr>
{% endfor %}
</table>

### Build-Time dependencies

<table>
    <tr>
        <th>Dependency</th>
        <th>Used</th>
        <th>Latest</th>
    </tr>
{% assign build = crate.dependencies | where: "kind", "Build" %}
{% for dependency in build %}
    <tr>
        <td>{{ dependency.name }}</td>
        <td>{{ dependency.project }}</td>
        <td>{{ dependency.latest }}</td>
    </tr>
{% endfor %}
</table>

### Development-Time dependencies

<table>
    <tr>
        <th>Dependency</th>
        <th>Used</th>
        <th>Latest</th>
    </tr>
{% assign development = crate.dependencies | where: "kind", "Development" %}
{% for dependency in development %}
    <tr>
        <td>{{ dependency.name }}</td>
        <td>{{ dependency.project }}</td>
        <td>{{ dependency.latest }}</td>
    </tr>
{% endfor %}
</table>

For more information, see the
[github repository](https://github.com/matthiasbeyer/actions-to-website).

