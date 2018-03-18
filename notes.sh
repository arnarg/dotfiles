export NOTES_FOLDER=~/Dropbox/notes

n() {
  case "$1" in
    "-h" | "--help")
      echo "Usage: n [command] <note>"
      echo "Commands:"
      echo "  n ls [namespace]"
      echo "  n search <grep search string> [namespace]"
      echo "  n cat <note>"
      echo ""
      echo "Simply run \"n <note>\" to create or edit note"
      return 0
    ;;
    "l" | "ls")
      find $NOTES_FOLDER -type f | sed -e "s|^$(realpath $NOTES_FOLDER)/||g" | grep "^$2"
      return 0
    ;;
    "s" | "search")
      if [[ ! -z "$2" ]]; then
        grep -rli "$2" $(realpath $NOTES_FOLDER/$3) | while read file
        do
          echo $(echo $file | sed -e "s|^$(realpath $NOTES_FOLDER)/*||g"):
          grep -nhi -C5 "$2" --color=always $file | sed -E 's/([0-9]+)[-:]/\1 /g'
          echo ""
        done
        return 0
      else
        echo "Usage: n $1 <grep search string> [namespace]"
        return 1
      fi
    ;;
    "c" | "cat")
      if [[ ! -z "$2" ]]; then
        cat $NOTES_FOLDER/$2
        return 0
      else
        echo "Usage: n $1 [note]"
        return 1
      fi
    ;;
    *)
      NOTE=$1
    ;;
  esac

  # create namespace if needed
  mkdir -p $(dirname $NOTES_FOLDER/$NOTE)
  # open note in editor
  $EDITOR $NOTES_FOLDER/$NOTE
  # update auto completions for app
  complete -o "default" -o "nospace" -W "$(n ls)" n
}

# Set initial auto-completion
complete -o "default" -o "nospace" -W "$(n ls)" n
