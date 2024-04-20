---
layout: single
title: cargo-deny reports
permalink: /deny/
---

This page shows the `cargo-deny` report summary for the last commit
on the `master` branch of the project.

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
    {% for report in site.data.denyreport[1].data %}
        {% if report.type == "summary" %}
        <tr>
            <td>
                <a href="https://github.com/matthiasbeyer/actions-to-website/commit/{{ object[1].rev }}">
                    {{ object[1].shortrev }}
                </a>
            </td>

            <td>{{ report.fields.advisories.errors }}</td>
            <td>{{ report.fields.advisories.warnings }}</td>
            <td>{{ report.fields.advisories.notes }}</td>
            <td>{{ report.fields.advisories.helps }}</td>

            <td>{{ report.fields.bans.errors }}</td>
            <td>{{ report.fields.bans.warnings }}</td>
            <td>{{ report.fields.bans.notes }}</td>
            <td>{{ report.fields.bans.helps }}</td>

            <td>{{ report.fields.licenses.errors }}</td>
            <td>{{ report.fields.licenses.warnings }}</td>
            <td>{{ report.fields.licenses.notes }}</td>
            <td>{{ report.fields.licenses.helps }}</td>

            <td>{{ report.fields.sources.errors }}</td>
            <td>{{ report.fields.sources.warnings }}</td>
            <td>{{ report.fields.sources.notes }}</td>
            <td>{{ report.fields.sources.helps }}</td>
        </tr>
        {% endif %}
    {% endfor %}
</table>

For more information, see the
[github repository](https://github.com/matthiasbeyer/actions-to-website).
