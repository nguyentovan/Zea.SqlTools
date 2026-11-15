# Zea.SqlTools

## Licenses

[Zea.SqlFormat](src/Zea.SqlFormat/README.md) is licensed under the [GNU Affero General Public License v3.0](LICENSE). This grant applies to Zea.SqlFormat. Zea.SqlLogConvert is a separate application.

Zea.SqlFormat incorporates [Right Way SQL Formatter](https://github.com/BadMonkeySoftware/right-way-sql-formatter), derived from Tao Klerks's Poor Man's T-SQL Formatter. The [upstream license](src/Zea.SqlFormat/Formatters/RightWay/LICENSE.txt) and source notices are included in the repository.

- 2026-11-14 — Zea adapted the Right Way formatter for the T-SQL command-line tool.
- 2026-11-15 — Zea integrated SQLFluff parsing for multiple dialects and refactored the formatter's layout logic.

[SQLFluff 4.5.0](https://github.com/sqlfluff/sqlfluff/tree/4.5.0) is distributed under its [MIT license](src/Zea.SqlFormat/licenses/SQLFluff.txt).
