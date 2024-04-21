---
layout: single
title: cargo-deny reports
permalink: /deny/
---

This page shows the `cargo-deny` report summary for the last commit
on the `master` branch of the project (as of
<a href="https://github.com/matthiasbeyer/actions-to-website/commit/{{ site.data.denyreport.gitrev }}">
    {{ site.data.denyreport.shortrev }}
</a>
).

<table border="1">
    <tr>
        <th></th>
        <th colspan="4">Advisories</th>
        <th colspan="4">Bans</th>
        <th colspan="4">Licenses</th>
        <th colspan="4">Sources</th>
    </tr>
    <tr>
        <th>Commit</th>

        <th>E</th>
        <th>W</th>
        <th>N</th>
        <th>H</th>

        <th>E</th>
        <th>W</th>
        <th>N</th>
        <th>H</th>

        <th>E</th>
        <th>W</th>
        <th>N</th>
        <th>H</th>

        <th>E</th>
        <th>W</th>
        <th>N</th>
        <th>H</th>
    </tr>
    <tr>
        <td>
            <a href="https://github.com/matthiasbeyer/actions-to-website/commit/{{ site.data.denyreport.gitrev }}">
                {{ site.data.denyreport.shortrev }}
            </a>
        </td>

        {% assign summary = site.data.denyreport.data | where: "type", "summary" | first %}

        <td style="background-color: {%- if summary.fields.advisories.errors > 0 -%}#FE2D00{%- else -%}#00000{%- endif -%};">{{ summary.fields.advisories.errors }}</td>
        <td style="background-color: {%- if summary.fields.advisories.warnings > 0 -%}#F3FF00{%- else -%}#00000{%- endif -%};">{{ summary.fields.advisories.warnings }}</td>
        <td style="background-color: {%- if summary.fields.advisories.notes > 0 -%}#D6EEEE{%- else -%}#00000{%- endif -%};">{{ summary.fields.advisories.notes }}</td>
        <td style="background-color: {%- if summary.fields.advisories.helps > 0 -%}#D6EEEE{%- else -%}#00000{%- endif -%};">{{ summary.fields.advisories.helps }}</td>

        <td style="background-color: {%- if summary.fields.bans.errors > 0 -%}#FE2D00{%- else -%}#00000{%- endif -%};">{{ summary.fields.bans.errors }}</td>
        <td style="background-color: {%- if summary.fields.bans.warnings > 0 -%}#F3FF00{%- else -%}#00000{%- endif -%};">{{ summary.fields.bans.warnings }}</td>
        <td style="background-color: {%- if summary.fields.bans.notes > 0 -%}#D6EEEE{%- else -%}#00000{%- endif -%};">{{ summary.fields.bans.notes }}</td>
        <td style="background-color: {%- if summary.fields.bans.helps > 0 -%}#D6EEEE{%- else -%}#00000{%- endif -%};">{{ summary.fields.bans.helps }}</td>

        <td style="background-color: {%- if summary.fields.licenses.errors > 0 -%}#FE2D00{%- else -%}#00000{%- endif -%};">{{ summary.fields.licenses.errors }}</td>
        <td style="background-color: {%- if summary.fields.licenses.warnings > 0 -%}#F3FF00{%- else -%}#00000{%- endif -%};">{{ summary.fields.licenses.warnings }}</td>
        <td style="background-color: {%- if summary.fields.licenses.notes > 0 -%}#D6EEEE{%- else -%}#00000{%- endif -%};">{{ summary.fields.licenses.notes }}</td>
        <td style="background-color: {%- if summary.fields.licenses.helps > 0 -%}#D6EEEE{%- else -%}#00000{%- endif -%};">{{ summary.fields.licenses.helps }}</td>

        <td style="background-color: {%- if summary.fields.sources.errors > 0 -%}#FE2D00{%- else -%}#00000{%- endif -%};">{{ summary.fields.sources.errors }}</td>
        <td style="background-color: {%- if summary.fields.sources.warnings > 0 -%}#F3FF00{%- else -%}#00000{%- endif -%};">{{ summary.fields.sources.warnings }}</td>
        <td style="background-color: {%- if summary.fields.sources.notes > 0 -%}#D6EEEE{%- else -%}#00000{%- endif -%};">{{ summary.fields.sources.notes }}</td>
        <td style="background-color: {%- if summary.fields.sources.helps > 0 -%}#D6EEEE{%- else -%}#00000{%- endif -%};">{{ summary.fields.sources.helps }}</td>
    </tr>
</table>

# Diagnostics

The following diagnostics were found.

For details see the last build in the
[github repository](https://github.com/matthiasbeyer/actions-to-website).

{% assign diagnostics = site.data.denyreport.data | where: "type", "diagnostic" %}

## Errors

<ul>
{% for diag in diagnostics %}
    {%- if forloop.length == 0 -%}
        <li>None</li>
        {% break %}
    {%- endif -%}

    {% if diag.fields.severity == "error" %}
        <li>{{ diag.fields.message }}</li>
    {% endif %}
{% endfor %}
</ul>

## Warnings

<ul>
{% for diag in diagnostics %}
    {%- if forloop.length == 0 -%}
        <li>None</li>
        {% break %}
    {%- endif -%}

    {% if diag.fields.severity == "warning" %}
        <li>{{ diag.fields.message }}</li>
    {% endif %}
{% endfor %}
</ul>

For more information, see the
[github repository](https://github.com/matthiasbeyer/actions-to-website).
