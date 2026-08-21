# prettymaps

A minimal Python library to draw customized maps from [OpenStreetMap](https://www.openstreetmap.org/#map=12/11.0733/106.3078) created using the [osmnx](https://github.com/gboeing/osmnx), [matplotlib](https://matplotlib.org/), [shapely](https://shapely.readthedocs.io/en/stable/index.html) and [vsketch](https://github.com/abey79/vsketch) packages.

![](https://github.com/marceloprates/prettymaps/raw/main/pictures/heerhugowaard.png)

# [![Docs](https://img.shields.io/badge/docs-GitHub%20Pages-blue?logo=github)](https://marceloprates.github.io/prettymaps/) [![PyPI](https://img.shields.io/pypi/v/prettymaps)](https://pypi.org/project/prettymaps/) [![Python](https://img.shields.io/badge/python-3.12%2B-blue)](https://www.python.org/) [![License](https://img.shields.io/badge/license-AGPL%20v3.0-green)](LICENSE)

This work is [licensed](LICENSE) under the GNU Affero General Public License v3.0. Commercial use is permitted subject to the license conditions. This fork also contains a practical commercial-print and OpenStreetMap attribution checklist in [`LEGAL.md`](LEGAL.md).

## Note about crediting and NFTs:
- Please keep the printed message on the figures crediting my repository and OpenStreetMap ([mandatory by their license](https://www.openstreetmap.org/copyright)).
- I am personally **against** NFTs for their [environmental impact](https://earth.org/nfts-environmental-impact/), the fact that they're a [giant money-laundering pyramid scheme](https://twitter.com/smdiehl/status/1445795667826208770) and the structural incentives they create for [theft](https://twitter.com/NFTtheft) in the open source and generative art communities.
- **I do not authorize in any way this project to be used for selling NFTs**, although I cannot legally enforce it. **Respect the creator**.
- The [AeternaCivitas](https://magiceden.io/marketplace/aeterna_civitas) and [geoartnft](https://www.geo-nft.com/) projects have used this work to sell NFTs and refused to credit it. See how they reacted after being exposed: [AeternaCivitas](https://github.com/marceloprates/prettymaps/raw/main/pictures/NFT_theft_AeternaCivitas.jpg), [geoartnft](https://github.com/marceloprates/prettymaps/raw/main/pictures/NFT_theft_geoart.jpg).
- **I have closed my other generative art projects on Github and won't be sharing new ones as open source to protect me from the NFT community**.

<a href='https://ko-fi.com/marceloprates_' target='_blank'><img height='36' style='border:0px;height:36px;' src='https://cdn.ko-fi.com/cdn/kofi1.png?v=3' border='0' alt='Buy Me a Coffee at ko-fi.com' /></a>

## As seen on [Hacker News](https://web.archive.org/web/20210825160918/https://news.ycombinator.com/news):
![](https://github.com/marceloprates/prettymaps/raw/main/pictures/hackernews-prettymaps.png)
## [prettymaps subreddit](https://www.reddit.com/r/prettymaps_/)
## [Tutorial](notebooks/tutorial.py) (marimo) · [Google Colaboratory Demo](https://colab.research.google.com/github/marceloprates/prettymaps/blob/master/notebooks/tutorial.py)

# Installation

## Windows Native (PowerShell, recommended for this fork)

This fork targets Python **3.12+**. The local virtual environment is intentionally ignored by Git and must be created on each machine.

```powershell
git clone https://github.com/JC-HOWE/prettymaps.git
cd prettymaps
.\setup_windows.ps1
.\run_windows.ps1
```

The setup script creates `.venv`, upgrades the packaging tools, and installs this fork in editable mode. The run script starts Streamlit with `.venv\Scripts\python.exe`, so activating the virtual environment is not required.

If PowerShell policy blocks local scripts, the same setup can be performed without activation:

```powershell
py -3.12 -m venv .venv
.\.venv\Scripts\python.exe -m pip install --upgrade pip setuptools wheel
.\.venv\Scripts\python.exe -m pip install -e .
.\.venv\Scripts\python.exe -m streamlit run app.py
```

The Streamlit app now writes generated PNG/SVG files to the operating system's temporary directory rather than assuming Linux `/tmp`, so the same code path works on Windows, Linux, and macOS.

### Install the published package locally

Install prettymaps with:

```
pip install prettymaps
```

If you want to work on this fork's source code, prefer `pip install -e .` from the cloned repository instead of the published PyPI package.

### Install on Google Colaboratory

Install prettymaps with:

```
!pip install -e "git+https://github.com/marceloprates/prettymaps#egg=prettymaps"
```

Then **restart the runtime** (Runtime -> Restart Runtime) before importing prettymaps.

# Run front-end

After prettymaps is installed, you can run the front-end (Streamlit) application from the prettymaps repository using:

```
streamlit run app.py
```

The app exports PNG and SVG files and includes OpenStreetMap plus prettymaps attribution in generated artwork. Before selling or distributing printed maps, read [`LEGAL.md`](LEGAL.md), especially the requirements for point-of-sale, packaging, and on-item OSM attribution.

# Tutorial

The full tutorial is at **[docs/tutorial.md](docs/tutorial.md)** — a markdown walkthrough with rendered images, the `[Plot]` dataclass fields, the `layers`/`style` parameters, presets, multiplot, hillshade, and keypoints.

![Heerhugowaard sample](docs/img/tour-01-heerhugowaard.png)

**Quick start:**

```python
import prettymaps

plot = prettymaps.plot('Stad van de Zon, Heerhugowaard, Netherlands')
```

| Resource | Where to find it |
|---|---|
| Full tutorial (markdown + images) | [`docs/tutorial.md`](docs/tutorial.md) |
| Interactive marimo notebook (runnable) | [`notebooks/tutorial.py`](notebooks/tutorial.py) |
| Open in Google Colab | [Open in Colab](https://colab.research.google.com/github/marceloprates/prettymaps/blob/master/notebooks/tutorial.py) |
| Streamlit front-end | `streamlit run app.py` |
| Windows setup | [`setup_windows.ps1`](setup_windows.ps1) |
| Commercial-use / attribution baseline | [`LEGAL.md`](LEGAL.md) |

### Run the tutorial locally (marimo)

```sh
# Install marimo (already in requirements.txt)
pip install marimo

# Open the notebook in your browser
marimo edit notebooks/tutorial.py
```

### Customizing parameters

The most important `prettymaps.plot()` parameters are:

- **`layers`** — dict of OpenStreetMap layers to fetch.
- **`style`** — dict of matplotlib style parameters per layer.
- **`preset`** — load a JSON preset (e.g. `'default'`, `'minimal'`, `'macao'`, `'tijuca'`).
- **`circle`** / **`radius`** / **`dilate`** — boundary shape.

`plot` is a dataclass with `geodataframes` (per-layer GeoDataFrames), `fig`, and `ax`.

```python
plot = prettymaps.plot(
    'Praça Ferreira do Amaral, Macau',
    circle=True,
    radius=1100,
    layers={
        "water": {"tags": {"natural": ["water", "bay"]}},
        "building": {"tags": {"building": True}},
    },
    style={
        "water": {"fc": "#a1e3ff", "ec": "#2F3737"},
        "building": {"palette": ["#FFC857", "#E9724C", "#C5283D"]},
    },
)
```

![Macau, custom parameters](docs/img/tour-03-macau-custom.png)

See [`docs/tutorial.md`](docs/tutorial.md) for the full set of examples (Macau, Bom Fim, mosaic, Barcelona plotter, Tijuca, multiplot, hillshade, Garopaba keypoints).
