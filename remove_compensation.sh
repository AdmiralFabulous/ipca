#!/bin/bash

# Remove compensation estimates from all individual complaints
for file in individual_complaints/complaint_*.md; do
    # Remove "## COMPENSATION ESTIMATE" sections and their values
    sed -i '/## COMPENSATION ESTIMATE/,/^$/d' "$file"
    # Remove compensation from headers like "($50k-$100k)"
    sed -i 's/ (\$[0-9]*k*-\$[0-9]*[kM]*)//g' "$file"
    # Remove standalone compensation lines
    sed -i '/^\*\*COMPENSATION.*\*\*/d' "$file"
    sed -i '/^## COMPENSATION:/d' "$file"
done

echo "Removed compensation estimates from individual complaints"
