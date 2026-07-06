#!/usr/bin/env -S uv run --script
#
# /// script
# requires-python = ">=3.13"
# dependencies = ["PyYAML"]
# ///

"""Usage: python3 bom_to_markdown.py input.yaml > output.md"""
import re, sys, yaml

def supplier_cell(c):
    text, url = c.get("supplier", ""), None
    m = re.match(r"^\[(.*?)\]\((.*?)\)$", text.strip()) if isinstance(text, str) else None
    if m:
        text, url = m.groups()
    url = c.get("supplier_link") or url
    cell = f"[{text}]({url})" if url else text
    return cell + (f" (SKU: {c['supplier_sku']})" if c.get("supplier_sku") else "")

def main():
    data = yaml.safe_load(open(sys.argv[1]))
    components = data.get("components", [])


    print("---")
    print("title: Bill of Materials")
    print("---")
    print("| ID | Component | Manufacturer | Qty | Supplier | Notes |")
    print("|---|---|---|---|---|---|")
    for c in components:
        row = [c.get(k, "") for k in ("id", "name", "manufacturer", "quantity")]
        row += [supplier_cell(c), c.get("notes", "")]
        print("| " + " | ".join(str(x).replace("|", "\\|") for x in row) + " |")
    print(f"\n_Total components: {len(components)}_")


if __name__ == "__main__":
    main()
