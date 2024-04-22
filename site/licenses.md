---
layout: single
title: cargo-license report
permalink: /licenses/
---

This page shows the `cargo-licenses` report for the last commit
on the `master` branch of the project (as of
<a href="https://github.com/matthiasbeyer/actions-to-website/commit/{{ site.data.licenses.gitrev }}">
    {{- site.data.licenses.shortrev -}}
</a>).

{% assign licenses = site.data.licenses.data %}

## Crate {{ crate.crate_name }}

<table>
    <tr>
        <th>Dependency</th>
        <th>Version</th>
        <th>License</th>
        <th>Author(s)</th>
    </tr>

    {% for license in licenses %}
        <tr>
            <td><a href="{{ license.repository }}">{{ license.name }}</a></th>
            <td>{{ license.version }}</td>
            <td>{{ license.license }}</td>
            <td>{{ license.authors }}</td>
        </tr>
    {% endfor %}
</table>

For more information, see the
[github repository](https://github.com/matthiasbeyer/actions-to-website).

