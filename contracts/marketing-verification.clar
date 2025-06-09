;; Marketing Department Verification Contract
;; Manages verification and authorization of marketing departments

(define-constant CONTRACT_OWNER tx-sender)
(define-constant ERR_UNAUTHORIZED (err u100))
(define-constant ERR_ALREADY_VERIFIED (err u101))
(define-constant ERR_NOT_VERIFIED (err u102))

;; Data maps
(define-map verified-departments principal bool)
(define-map department-info principal {
    name: (string-ascii 50),
    contact: (string-ascii 100),
    verified-at: uint
})

;; Read-only functions
(define-read-only (is-verified (department principal))
    (default-to false (map-get? verified-departments department))
)

(define-read-only (get-department-info (department principal))
    (map-get? department-info department)
)

;; Public functions
(define-public (verify-department (department principal) (name (string-ascii 50)) (contact (string-ascii 100)))
    (begin
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
        (asserts! (not (is-verified department)) ERR_ALREADY_VERIFIED)
        (map-set verified-departments department true)
        (map-set department-info department {
            name: name,
            contact: contact,
            verified-at: block-height
        })
        (ok true)
    )
)

(define-public (revoke-verification (department principal))
    (begin
        (asserts! (is-eq tx-sender CONTRACT_OWNER) ERR_UNAUTHORIZED)
        (asserts! (is-verified department) ERR_NOT_VERIFIED)
        (map-delete verified-departments department)
        (map-delete department-info department)
        (ok true)
    )
)
