# Legal and attribution baseline

This document records the licensing and attribution baseline for this fork. It is a practical engineering checklist, not legal advice.

## 1. prettymaps software license

The repository `LICENSE` file is the GNU Affero General Public License version 3 (AGPL-3.0). Source-file headers also state AGPL version 3 or, at your option, any later version.

The previous `setup.py` metadata incorrectly declared `MIT License`. This fork aligns the package metadata with the repository license and uses `GNU Affero General Public License v3 or later (AGPLv3+)`.

Commercial use is allowed by the AGPL, subject to the license conditions.

Important operational distinction:

- Running the software privately does not by itself require publication of private modifications.
- Distributing covered software creates source-code and notice obligations under the AGPL.
- If a modified AGPL program is made available for users to interact with remotely over a computer network, AGPL section 13 requires those remote users to be offered the Corresponding Source for that modified version.
- Output from running an AGPL-covered program is covered by the AGPL only when the output itself constitutes a covered work. Ordinary rendered map artwork is therefore not automatically AGPL-licensed merely because prettymaps generated it. Other data/content licenses still apply.

Keep the upstream copyright and license notices intact when modifying or redistributing prettymaps.

## 2. OpenStreetMap data and printed artwork

prettymaps fetches OpenStreetMap (OSM) data. OSM data is distributed under the Open Database License (ODbL), with attribution requirements that apply separately from the prettymaps software license.

For rendered maps and printed products, preserve a readable OSM attribution. The OpenStreetMap Foundation's attribution guidance for printed maps, artwork, household goods, and similar merchandise requires attribution to be visible in the customary credit location and requires the OSM copyright URL to be printed out. For physical merchandise with an aesthetic component, the guidance calls for attribution at the point of sale, on packaging, and, to the extent possible, on the item itself.

Recommended artwork credit used by this fork's Streamlit app:

> Map data © OpenStreetMap contributors — openstreetmap.org/copyright
>
> Rendered with prettymaps — github.com/marceloprates/prettymaps

Do not remove the OSM attribution from commercial print exports without replacing it with a compliant attribution elsewhere according to the applicable OSM guidance.

The upstream prettymaps README also asks users to retain a prettymaps repository credit on figures. This fork preserves that project attribution by default as a provenance and creator-credit practice.

## 3. Selling canvas prints or posters

Before selling a generated map as a canvas, poster, framed print, or other physical product:

1. Keep the OSM attribution readable on the artwork where practical.
2. Repeat the OSM attribution and `openstreetmap.org/copyright` in the product listing or point-of-sale material.
3. Include the attribution on packaging or an included card/label.
4. Keep the prettymaps creator/project credit unless you have separately confirmed a different compliant treatment.
5. Verify licenses for every additional asset you introduce, including fonts, icons, textures, satellite imagery, POI datasets, photographs, elevation datasets, and third-party APIs.
6. If this fork becomes a customer-facing hosted map-generation service, provide an AGPL source-code offer/link for the modified software used by remote users.

## 4. Fork policy for future development

For this fork, new commercial-product features should follow these defaults:

- Do not silently disable OSM attribution.
- Keep attribution text configurable in style/placement, but make the compliant form the default.
- Keep `LICENSE` and package metadata aligned.
- Document third-party datasets before introducing them into commercial exports.
- Re-review licensing before adding proprietary map tiles, fonts, stock assets, or external geodata providers.

## References

- Repository license: `LICENSE`
- OpenStreetMap copyright: https://www.openstreetmap.org/copyright
- OSM Foundation attribution guidance: https://osmfoundation.org/wiki/Licence/Attribution_Guidelines
- GNU AGPL v3: https://www.gnu.org/licenses/agpl-3.0.html
- GNU GPL/AGPL FAQ: https://www.gnu.org/licenses/gpl-faq.html
