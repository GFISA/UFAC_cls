#!/bin/bash

# Define the main LaTeX file name
MAIN_FILE="main"

# Define a list of common LaTeX file extensions to clean up.
# This list is more comprehensive and uses a different approach for deletion.
CLEANUP_EXTENSIONS=(
    "*.aux" "*.log" "*.toc" "*.lof" "*.lot" "*.out" "*.fls" "*.fdb_latexmk"
    "*.blg" "*.bbl" "*.idx" "*.ilg" "*.ind" "*.synctex.gz*" "*.nav" "*.snm"
    "*.vrb" "*.dvi" "*.ps" "*.bak" "*.run.xml" "*.thm" "*.tdo" "*.lol" "*.loF"
    "*.dep" "*.dpth" "*.mtc*" "*.maf" "*.mlf" "*.mlt" "*.mtl" "*.acn" "*.acr"
    "*.alg" "*.glg" "*.glo" "*.gls" "*.ist" "*.xdy" "*.loc" "*.bcf" "*.run.xml"
    "*.mw" "*.gz" # Common compression extension for synctex
)


# Clean up previous compilation files
echo "Cleaning up previous compilation files..."
for ext in "${CLEANUP_EXTENSIONS[@]}"; do
    # Remova as aspas duplas para permitir a expansão do curinga
    # Mantenha o -f para forçar e o 2>/dev/null para suprimir erros
    rm -f $ext 2>/dev/null
done

# Clean up specific files that might not match simple globs
rm -f "$MAIN_FILE.bcf" "$MAIN_FILE.run.xml" "$MAIN_FILE.mw" 2>/dev/null

# Run pdflatex for initial pass
echo "Running pdflatex (first pass)..."
pdflatex -interaction=nonstopmode "$MAIN_FILE.tex"

# Run biber for bibliography processing
echo "Running biber..."
biber "$MAIN_FILE"

# Run pdflatex again to resolve all references and update TOC/LOF/LOT
echo "Running pdflatex (second pass)..."
pdflatex -interaction=nonstopmode "$MAIN_FILE.tex"

# Run pdflatex one more time to ensure all cross-references are correct
echo "Running pdflatex (third pass - for final references)..."
pdflatex -interaction=nonstopmode "$MAIN_FILE.tex"

echo "Compilation complete. Check '$MAIN_FILE.pdf' for the output."

# Open the generated PDF with Okular
echo "Opening PDF with Okular..."
okular "$MAIN_FILE.pdf" & # Use '&' to open Okular in the background, allowing the script to finish

# Clean up previous compilation files
echo "Cleaning up previous compilation files..."
for ext in "${CLEANUP_EXTENSIONS[@]}"; do
    # Using 'rm -f' with globbing directly is often simpler for this task,
    # as long as the globbing doesn't expand to too many files for shell limits.
    # The '2>/dev/null' suppresses "No such file or directory" errors.
    rm  "$ext" 2>/dev/null
done

# Clean up specific files that might not match simple globs (e.g., main.bcf)
rm "$MAIN_FILE.bcf" "$MAIN_FILE.run.xml" "$MAIN_FILE.mw" 2>/dev/null


rm *.aux *.log *.toc *.lof *.lot *.out *.fls *.fdb_latexmk
rm *.blg *.bbl *.idx *.ilg *.ind *.synctex.gz *.nav *.snm
rm *.vrb *.dvi *.ps *.bak *.run.xml *.thm *.tdo *.lol *.loF
rm *.dep *.dpth *.mtc *.maf *.mlf *.mlt *.mtl *.acn *.acr
rm *.alg *.glg *.glo *.gls *.ist *.xdy *.loc *.bcf *.run.xml
rm *.mw *.gz